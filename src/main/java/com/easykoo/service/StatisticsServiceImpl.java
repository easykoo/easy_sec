package com.easykoo.service;

import com.easykoo.model.Statistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Jesse on 14-3-24.
 */
@Service("statisticsService")
public class StatisticsServiceImpl implements IStatisticsService {
    private ISessionLogService sessionLogService;

    @Override
    public Statistics getStatistics() {
        Statistics statistics = new Statistics();
        statistics.setTotalCount(sessionLogService.getTotalCount());
        statistics.setMonthCount(sessionLogService.getMonthCount());
        statistics.setDayCount(sessionLogService.getDayCount());
        return statistics;
    }

    public ISessionLogService getSessionLogService() {
        return sessionLogService;
    }

    @Autowired
    public void setSessionLogService(ISessionLogService sessionLogService) {
        this.sessionLogService = sessionLogService;
    }
}
