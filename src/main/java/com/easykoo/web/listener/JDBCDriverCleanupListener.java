package com.easykoo.web.listener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

/**
 * Created by Steven on 2015/6/26.
 */
public class JDBCDriverCleanupListener implements ServletContextListener {

    private static Log logger = LogFactory.getLog(JDBCDriverCleanupListener.class);
    private Driver driver = null;

    /**
     * Registers the Mysql JDBC driver
     */
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        try {
            this.driver = new com.mysql.jdbc.Driver(); // load and instantiate the class
        } catch (SQLException e) {
            e.printStackTrace();
        }
        boolean skipRegistration = false;
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            if (driver instanceof com.mysql.jdbc.Driver) {
                com.mysql.jdbc.Driver alreadyRegistered = (com.mysql.jdbc.Driver) driver;
                if (alreadyRegistered.getClass() == this.driver.getClass()) {
                    // same class in the VM already registered itself
                    skipRegistration = true;
                    this.driver = alreadyRegistered;
                    break;
                }
            }
        }

        try {
            if (!skipRegistration) {
                DriverManager.registerDriver(driver);
            } else {
                logger.debug("driver was registered automatically");
            }
            logger.info(String.format("registered jdbc driver: %s v%d.%d", driver,
                    driver.getMajorVersion(), driver.getMinorVersion()));
        } catch (SQLException e) {
            logger.error(
                    "Error registering oracle driver: " +
                            "database connectivity might be unavailable!",
                    e);
            throw new RuntimeException(e);
        }
    }

    /**
     * Deregisters JDBC driver
     *
     * Prevents Tomcat 7 from complaining about memory leaks.
     */
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        if (this.driver != null) {
            try {
                DriverManager.deregisterDriver(driver);
                logger.info(String.format("deregistering jdbc driver: %s", driver));
            } catch (SQLException e) {
                logger.warn(
                        String.format("Error deregistering driver %s", driver),
                        e);
            }
            this.driver = null;
        } else {
            logger.warn("No driver to deregister");
        }

    }


}
