package com.shopmoba.config;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.shopmoba.authentication.MyDBAuthenticationService;
 
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
 
   @Autowired
   MyDBAuthenticationService myDBAauthenticationService;
 
   @Autowired
   public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
 
       // For User in database.
       auth.userDetailsService(myDBAauthenticationService);
 
   }
 
   @Override
   protected void configure(HttpSecurity http) throws Exception {
 
       http.csrf().disable();

       http.authorizeRequests().antMatchers("/orderList","/order", "/accountInfo")
               .access("hasAnyRole('ROLE_EMPLOYEE', 'ROLE_MANAGER')");
 
       http.authorizeRequests().antMatchers("/product","/signup", "/deleteProduct", "/deleteOrder").access("hasRole('ROLE_MANAGER')");
 
       http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
 
       // Config for Login Form
       http.authorizeRequests().and().formLogin()
               // Submit URL of login page.
               .loginProcessingUrl("/j_spring_security_check") // Submit URL
               .loginPage("/login")   //default url when dont have permission to access page.
               .defaultSuccessUrl("/accountInfo")
               .failureUrl("/login?error=true")
               .usernameParameter("userName")
               .passwordParameter("password")
               // Config for Logout Page
               // (Go to home page).
               .and().logout().logoutUrl("/logout").logoutSuccessUrl("/");
 
   }
}