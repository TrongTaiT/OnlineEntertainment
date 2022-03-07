package com.oe.utility;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

public class XBean {

	private HttpServletRequest request;

	public XBean(HttpServletRequest request) {
		this.request = request;
	}

	public <T> T getBean(Class<T> clazz, String paramName) {
		DateTimeConverter dtc = new DateConverter(XDate.toDate(request.getParameter(paramName)));
		dtc.setPattern("yyyy-MM-dd");
		ConvertUtils.register(dtc, Date.class);
		try {
			T bean = clazz.getDeclaredConstructor().newInstance();
			BeanUtils.populate(bean, request.getParameterMap());
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
