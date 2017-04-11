package org.craftsman.roy.gift.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.common.collect.Maps;

/**
 *
 * @author luoyh
 * @date Mar 31, 2017
 */
@Controller
@RequestMapping("/pay")
public class MoPayController {
	
	public static void main(String[] args) {
		new MoPayController().buildForm("1.0.0.0", "1.0.0.1", "c");
	}
	
	private static final String MD5HEX = "b87ade8eb2321835daa0330d581c7123";
	private static final String platformID = "210001510010949";
	private static final String merchNo =    "210001510010949";
	private static final String DEFAULT_VERSION = "1.0.0.0";
	
	private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyyMMdd");
	private static final DecimalFormat DF = new DecimalFormat(".##");
	private String now() {
		return SDF.format(new Date());
	}
	
	private String buildForm(String url, String version, String ip) {
		Map<String, String> map = Maps.newHashMap();
		map.put("apiName", url);
		map.put("apiVersion", version);
		map.put("platformID", platformID);
		map.put("merchNo", merchNo);
		map.put("orderNo", System.currentTimeMillis() + "");
		map.put("tradeDate", now());
		map.put("amt", DF.format(Math.random() * 100));
		map.put("merchUrl", "https://www.kdpay.com");
		map.put("merchParam", "id%3D33%26name%3D44");
		map.put("tradeSummary", "hello world");
		String[] keys = {"apiName", "apiVersion", "platformID", "merchNo", "orderNo", "tradeDate", "amt", "merchUrl", "merchParam", "tradeSummary", "customerIP"};
		int end = keys.length - 1;
		if (!DEFAULT_VERSION.equals(version)) {
			map.put("customerIP", ip);
			end ++;
		}
		//map.put("signMsg", "kidkaiskxxiix");
		//map.put("bankCode", "ICBC");
		//map.put("choosePayType", "4");

		int start = 0;
		StringBuilder sb = new StringBuilder();
		for (String key : keys) {
			if (start ++ >= end) break;
			sb.append(key).append("=").append(map.get(key)).append("&");
		}
		sb.deleteCharAt(sb.length() - 1).append(MD5HEX);
		String signMsg = DigestUtils.md5DigestAsHex(sb.toString().getBytes());
		map.put("signMsg", signMsg);
		
		StringBuilder html = new StringBuilder();
		html.append("<form target=\"_blank\" name=\"f1\" style=\"display:none;\" action=\"https://trade.mobaopay.com/cgi-bin/netpayment/pay_gate.cgi\" method=\"POST\">");
		for (Map.Entry<String, String> entry : map.entrySet()) {
			html.append("<input type=\"hidden\" name=\"").append(entry.getKey()).append("\" value=\"").append(entry.getValue()).append("\">");
		}

		html.append("</form><script>document.forms['f1'].submit();</script>");
		return html.toString();
	}
	
	@GetMapping("/normal/{url}")
	public void submit(@PathVariable("url") String url, @RequestParam(defaultValue = "1.0.0.0", value = "version", required = false) String version, HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(buildForm(url, version, getRemoteHost(request)));
        out.flush();
        out.close();
	}
	
	@GetMapping("/async/notify")
	public String asyncNotify() {
		
		return "SUCCESS";
	}
	
	private String getRemoteHost(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
	}

}
