package com.bus.test.TestJedis;

import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Before;
import redis.clients.jedis.Jedis;

import java.io.IOException;
import java.util.Map;

public class Test {
    Jedis jedis;
    @Before
    public void before(){
        //1.打开连接
        jedis = new Jedis("localhost");
        System.out.println("--- Redis 连接成功 ---");
    }

    @org.junit.Test
    public void onr(){
        //写字符串到redis里面
//        jedis.set("one","hello,java");
//        jedis.set("two","hello,os");
//        jedis.set("three","hello,linux");

        //得到数据
        String two = jedis.get("two");
        System.out.println(two);
        jedis.close();

    }

    @org.junit.Test
    public void two(){
        //哈希操作
//        jedis.hset("os","one","windows");
//        jedis.hset("os","two","ios");
//        jedis.hset("os","three","linux");

        //得到数据
        String s = jedis.hget("os", "two");
        System.out.println(s);
        jedis.close();
    }

    @org.junit.Test
    public void three(){
        //给键设过期时间,过期时间以秒为单位
//        jedis.set("test2","1122");
//        jedis.expire("test2",20);
        Long time = jedis.ttl("test2");
        System.out.println(time);
    }

    @org.junit.Test
    public void four(){
        //把对象写入到redis中
        /*Categorys cate = new Categorys(1, "水果类", "好吃的水果");
        System.out.println(cate);

        //用hash来测试
        HashMap<String,String> map = new HashMap<>();
        map.put("id",cate.getCategoryid()+"");
        map.put("name", cate.getCategoryName());
        map.put("desc", cate.getCategoryDesc());
        jedis.hmset("category",map);*/

        Map<String, String> map = jedis.hgetAll("category");
        for (Map.Entry<String,String> s:map.entrySet()
             ) {
            System.out.println(s);
        }

    }

    @org.junit.Test
    //把对象写入到redis第二种方式
    public void five() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
       /* //jackson要用到的对象
        ObjectMapper objectMapper = new ObjectMapper();
        Categorys cate = new Categorys(2, "海鲜类", "海里面好吃的");
        //把对象转成json字符串
        String s = objectMapper.writeValueAsString(cate);
        jedis.set("cate2",s);*/

        //读出来成为对象
        String jsonString = jedis.get("cate2");
        System.out.println(jsonString);

        //把得到的json字符串转成java对象
        /*Categorys c = objectMapper.readValue(jsonString, Categorys.class);
        System.out.println(c);*/
    }
}

