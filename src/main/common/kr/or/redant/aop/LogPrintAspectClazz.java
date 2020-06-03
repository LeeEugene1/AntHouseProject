package kr.or.redant.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

@Component("logPrintAspect")
public class LogPrintAspectClazz {
	@Loggable
	private static Logger logger;
	
	// advice : 시점
	// joinpoint 호출 전에 aspect(로그출력 코드) weavig
	public void theWholeJoinpointCallBefore(JoinPoint joinpoint){
		// aspect가 weaving될 대상 joinpoint(메서드)를 포함하는 빈 클래스의 팩키지.빈클래스명
		String className = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		logger.debug("target bean class : {} | joinpoint : {}가 호출되었습니다.", className, joinpointName);
		
	}
	
	// joinpoint 종료 후에 aspect(로그출력 코드) weavig
	public void theWholeJoinpointCallAfter(JoinPoint joinpoint){
		// aspect가 weaving될 대상 joinpoint(메서드)를 포함하는 빈 클래스의 팩키지.빈클래스명
		String className = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		logger.debug("target bean class : {} | joinpoint : {}가 종료되었습니다.", className, joinpointName);
		
	}
	
	// joinpoint 익셉션 발생 이후에 aspect(로그출력 코드) weavig
	public void theWholeJoinpointCallThrowing(JoinPoint joinpoint, Exception ex){
		// aspect가 weaving될 대상 joinpoint(메서드)를 포함하는 빈 클래스의 팩키지.빈클래스명
		String className = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		logger.debug("target bean class : {} | joinpoint : {}가 호출 후 {} 익셉션이 발생되었습니다.", className, joinpointName, ex.getMessage());
		
	}
	
	// joinpoint 호출 전/종료 후에 aspect(로그출력 코드) weavig
	public Object theWholeJoinpointCallAround(ProceedingJoinPoint joinpoint) throws Throwable{
		// aspect가 weaving될 대상 joinpoint(메서드)를 포함하는 빈 클래스의 팩키지.빈클래스명
		String className = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		logger.debug("target bean class : {} | joinpoint : {}가 호출 되고...", className, joinpointName);
		
		// 상단 해당 joinpoint 호출전에 weaving되는 aspect 구성
		// 해당 joinpoint(메서드) return값
		Object returnValue = joinpoint.proceed();
		// 하단 해당 joinpoint 종료후에 weaving되눈aspect 구성
		
		logger.debug("target bean class : {} | joinpoint : {}가 종료되었습니다.", className, joinpointName);
		
		return returnValue;
	}
}
