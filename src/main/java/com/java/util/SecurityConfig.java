package com.java.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth)throws Exception{
        auth.inMemoryAuthentication()
                .withUser("Tom").password("123456").roles("USER");
    }
    protected  void configure(HttpSecurity http)throws Exception{
        http.authorizeRequests()
                .antMatchers("/admin**").access("hasRole('ROLE_USER')")
                .and()
                    .formLogin().loginPage("login/login").failureUrl("login/login?error")
                .usernameParameter("username").passwordParameter("password")
                .and()
                    .logout().logoutSuccessUrl("login/login?logout")
                .and()
                    .csrf();
    }

}
