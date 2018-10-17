package com.imooc.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtil {

    public static String toJson(Object object) {
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.setPrettyPrinting();//将字符串格式化
        Gson gson = gsonBuilder.create();
        return gson.toJson(object);
    }
}
