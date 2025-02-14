package com.puft.feb122.test;

import java.util.List;

public interface TestMapper {
     public abstract int regTest(Test t);
     //변수명은 xml의 식별자와 같게 파라미터가 들어갔다면
     //파라미터의 부분도 잘 맞춰주어야함
     public abstract List<Test> getAllTest();
}
