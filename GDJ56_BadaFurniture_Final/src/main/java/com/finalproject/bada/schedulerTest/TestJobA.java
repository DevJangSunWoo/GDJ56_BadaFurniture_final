package com.finalproject.bada.schedulerTest;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class TestJobA extends QuartzJobBean { // extends QuartzJobBean

	private static final Logger log = LoggerFactory.getLogger(TestJobA.class); 
	// TestJobA.class  해달클래명.class

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		// TODO Auto-generated method stub
		//이곳에 실행하고자하는 메소드 작성		
		//log.info("시간 설정 5초 마다 job 실행");
		
	}
	
	
	
	
	
}
