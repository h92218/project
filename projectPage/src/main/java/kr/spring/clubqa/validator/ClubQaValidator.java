package kr.spring.clubqa.validator;

import org.springframework.validation.Errors;

import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kr.spring.clubqa.domain.ClubQAVO;

public class ClubQaValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return ClubQAVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(
				               errors,"id","required");
		ValidationUtils.rejectIfEmptyOrWhitespace(
	                          errors,"passwd","required");
		ValidationUtils.rejectIfEmptyOrWhitespace(
	                           errors,"name","required");
	}

}




