package org.akaza.openclinica.control;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class URLUtils {

    public static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
}
