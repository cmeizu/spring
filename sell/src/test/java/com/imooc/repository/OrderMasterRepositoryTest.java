package com.imooc.repository;

import com.imooc.dataobject.OrderMaster;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderMasterRepositoryTest {

    @Autowired
    private  OrderMasterRepository repository;

    private final String OPENID = "110110";


    @Test
    public void saveTest(){
        OrderMaster orderMaster = new OrderMaster("123457", "cmeizu", "12345678910", "幕课网", "110110", new BigDecimal(2.5));

        OrderMaster result = repository.save(orderMaster);
        Assert.assertNotNull(result);

    }

    @Test
    public void findByOrderId() throws Exception{
        PageRequest request = new PageRequest(1,3);

        Page<OrderMaster> result = repository.findByBuyerOpenid(OPENID,request);
        Assert.assertNotEquals(0,result.getTotalElements());
    }
}