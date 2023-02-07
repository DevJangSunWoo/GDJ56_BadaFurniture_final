package com.finalproject.bada.schedulerTest;


import static org.quartz.JobBuilder.newJob;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;

import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import com.finalproject.bada.order.controller.OrderController;

@Configuration
public class JobConfig {
	
	@Autowired
	private Scheduler scheduler; // 쿼츠 스케줄 객체
	
	
//	@PostConstruct는 의존성 주입이 이루어진 후 초기화를 수행하는 메서드이다.
//	@PostConstruct가 붙은 메서드는 클래스가 service(로직을 탈 때? 로 생각 됨)를 수행하기 전에 발생한다.
//	이 메서드는 다른 리소스에서 호출되지 않는다해도 수행된다. 
	
	@PostConstruct
	public void run(){
		JobDetail detail = runJobDetail(OrderController.class, new HashMap<>()); //TestJobA.class  //  실행할클래스명.class
		
		try {
            	// 크론형식 지정 후 스케줄 시작 
			// "0/10 * * * * ?"  10초마다 실행
			//세부 시간 설정 추가 필요함!!!
			//0 0/5 * * * ?  5분마다
			scheduler.scheduleJob(detail, runJobTrigger("0 0 0 3 * ?")); // 이곳은 반복주기 설정하는 곳//3일을 실정하면 3일뒤에 무조건 실행한다. "0 0 0 3 * ?"
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		
	}
	
	public Trigger runJobTrigger(String scheduleExp){
        	// 크론 스케줄 사용
		return TriggerBuilder.newTrigger()
				.withSchedule(CronScheduleBuilder.cronSchedule(scheduleExp)).build();
	}
	
	public JobDetail runJobDetail(Class job, Map params){
		JobDataMap jobDataMap = new JobDataMap();
		jobDataMap.putAll(params);
	    // 스케줄 생성
		return newJob(job).usingJobData(jobDataMap).build();
	}
	
	
}
