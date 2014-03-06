package com.easykoo.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Jesse on 14-3-5.
 */
public class CookiesUtil {
    public static int expiry = 7 * 24 * 60 * 60; //s

    public static void createCookies(String username, String sessionId, HttpServletResponse response) {
        Cookie ckUsername, ckSessionId;
        ckUsername = new Cookie("username", username);
        ckUsername.setMaxAge(expiry);
        ckUsername.setPath("/");
        response.addCookie(ckUsername);

        ckSessionId = new Cookie("sessionId", sessionId);
        ckSessionId.setMaxAge(expiry);
        ckSessionId.setPath("/");
        response.addCookie(ckSessionId);
    }

    public static void clearCookies(HttpServletResponse response) {
        Cookie ckUsername, ckSessionId;
        ckUsername = new Cookie("username", null);
        ckUsername.setMaxAge(0);
        ckUsername.setPath("/");
        response.addCookie(ckUsername);

        ckSessionId = new Cookie("sessionId", null);
        ckSessionId.setMaxAge(0);
        ckSessionId.setPath("/");
        response.addCookie(ckSessionId);
    }
}
