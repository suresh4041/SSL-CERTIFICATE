package com.example.sslserver.Controller;

import java.util.Arrays;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/")
@RestController
public class DistanceController {
	

	@RequestMapping(value="/page", method = RequestMethod.GET)
	public ModelAndView listContact(Model model) {
		
		return new ModelAndView("wes-login");
	}
	@RequestMapping("/distance")
	public int getDistance(@RequestParam String str1,@RequestParam String str2){
		int[][] result= findDistance(str1,str2);
		return result[str1.length()][str2.length()];
	}
	@RequestMapping("/webdistance")
	public int[][] getWebDistance(@RequestParam String str1,@RequestParam String str2){
		int[][] result= findDistance(str1,str2);
		return result;
	}

	private int[][] findDistance(String x, String y) {
	    int[][] dp = new int[x.length() + 1][y.length() + 1];
	    
	    for (int i = 0; i <= x.length(); i++) {
	        for (int j = 0; j <= y.length(); j++) {
	            if (i == 0) {
	                dp[i][j] = j;
	            }
	            else if (j == 0) {
	                dp[i][j] = i;
	            }
	            else {
	                dp[i][j] = min(dp[i - 1][j - 1] 
	                 + costOfSubstitution(x.charAt(i - 1), y.charAt(j - 1)), 
	                  dp[i - 1][j] + 1, 
	                  dp[i][j - 1] + 1);
	            }
	        }
	    }
	 
	    return dp;
	}
	 public static int costOfSubstitution(char a, char b) {
	        return a == b ? 0 : 1;
	    }
	 
	    public static int min(int... numbers) {
	        return Arrays.stream(numbers)
	          .min().orElse(Integer.MAX_VALUE);
	    }
}
