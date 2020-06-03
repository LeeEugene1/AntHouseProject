package kr.or.redant.crawler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler{
	String URL = "";
	String stockCode = "";
	
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	
	public String getStockCode() {
		return stockCode;
	}
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}
	
	public Map<String,Object> crawlSelector(String target) throws Exception{
		Map<String, Object> crawlMap = new HashMap<String, Object>();
		List<Object> crawlList = new ArrayList<Object>();
		Elements elem = null;
		String str = null;	
		Elements listSelect = null;
		int listSize = 0;
		if(target.equals("newsList")){
			URL = "https://finance.naver.com/news/mainnews.nhn";
			Document doc = Jsoup.connect(URL).get();
			
			crawlList.clear();
			listSelect = doc.select(".newsList li");
			listSize = listSelect.size();
			Elements elem1 = null;
			String str1 = null;
			
			Elements elem2 = null;
			String str2 = null;
			
			Elements elem3 = null;
			String str3 = null;
			
			Elements elem4 = null;
			String str4 = null;
			
			String str5 = null;
			for(int i=0; i < listSize; i++){
				elem1 = listSelect.get(i).select(".articleSubject a");
				str1 = elem1.text();
				
				elem2 = listSelect.get(i).select(".articleSummary");
				str2 = elem2.text();
				
				elem3 = listSelect.get(i).select(".press");
				str3 = elem3.text();
				
				elem4 = listSelect.get(i).select(".wdate"); 
				str4 = elem4.text();
				
				str5 = elem1.attr("href");
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("newsTitle", str1);
				tempMap.put("newsDesc", str2);
				tempMap.put("newsAuth", str3);
				tempMap.put("newsDate", str4);
				tempMap.put("newsLink", str5);
				crawlList.add(tempMap);
			}
			crawlMap.put("newsList",crawlList);
		}
//		newsList ===>		
//		<=== newsView
		if(target.equals("newsView")){
			Document doc = Jsoup.connect(URL).get();
			elem = doc.select(".article_info h3");
			str = elem.text();
			
			Elements elem1 = doc.select(".press img");
			String str1 = elem1.attr("src");
			
			Elements elem2 = doc.select(".article_date");
			String str2 = elem2.text();
			
			String remove = "a,div";
			Elements elem3 = doc.select(".articleCont");
			elem3.select(remove).remove();
			String str3 = elem3.html();
			
			crawlMap.put("newsTitle",str);
			crawlMap.put("newsAuth",str1);
			crawlMap.put("newsDate",str2);
			crawlMap.put("newsDesc",str3);
		}
//		newsView ===>
		
//		<=== forumView
		if(target.equals("forumView")){
			Document doc = Jsoup.connect(URL).get();
			String str0 = doc.select(".view tbody tr").get(0).select("th").get(0).text();
			String str1 = doc.select(".view tbody tr").get(0).select("th").get(1).select("span").text();
			String str2 = doc.select(".view tbody tr").get(0).select("th").get(1).select("strong").get(0).text();
			String str3 = doc.select(".view tbody tr").get(0).select("th").get(1).select("strong").get(1).text();
			String str4 = doc.select(".view tbody tr").get(1).select("th").get(0).select("strong").text();
			String str5 = doc.select(".view tbody tr").get(1).select("th").get(1).text();
			String str6 = doc.select(".view tbody tr").get(2).select("td div div").html();
			
			crawlMap.put("forumTitle",str0);
			crawlMap.put("forumCount",str1);
			crawlMap.put("forumUp",str2);
			crawlMap.put("forumDown",str3);
			crawlMap.put("forumAuth",str4);
			crawlMap.put("forumDate",str5);
			crawlMap.put("forumContent",str6);
		}
//		forumView ===>
		
//		<=== main
		if(target.equals("main")){
			URL = "https://finance.naver.com/";
			Document doc = Jsoup.connect(URL).get();
			String[] keyArr = {"kospiTitle","kospiNum1","kospiNum2","kospiNum3","kospiImg","kosdaqTitle","kosdaqNum1","kosdaqNum2","kosdaqNum3","kosdaqImg","kospi200Title","kospi200Num1","kospi200Num2","kospi200Num3","kospi200Img","kospiStatus","kosdaqStatus","kospi200Status","stockTime"};
			String[] valArr = {".kospi_area .heading_area em .blind", ".kospi_area .heading_area .num", ".kospi_area .heading_area .num2", ".kospi_area .heading_area .num3",".kospi_area img",".kosdaq_area .heading_area em .blind", ".kosdaq_area .heading_area .num", ".kosdaq_area .heading_area .num2", ".kosdaq_area .heading_area .num3",".kosdaq_area img",".kospi200_area .heading_area em .blind", ".kospi200_area .heading_area .num", ".kospi200_area .heading_area .num2", ".kospi200_area .heading_area .num3",".kospi200_area img",".kospi_area .heading_area .num_quot > .blind",".kosdaq_area .heading_area .num_quot > .blind",".kospi200_area .heading_area .num_quot > .blind", "#time"};
			
			String URL1 = "https://finance.naver.com/sise/";
			Document doc1 = Jsoup.connect(URL1).get();
			String[] keyArr1 = {"kospiBigImg","kosdaqBigImg","kospi200BigImg"};
			String[] valArr1 = {"#tab_sel1_sise_main_chart img","#tab_sel2_sise_main_chart img","#tab_sel3_sise_main_chart img"};
			Elements elem0 = null;
			String str0 = null;
			
			for(int i=0; i<keyArr.length; i++){
				elem = doc.select(valArr[i]);
				
				if(elem.is("img")){
					str = elem.attr("src");
				}else{
					str = elem.text();
				}
				crawlMap.put(keyArr[i], str);
			}
			
			for(int i=0; i<keyArr1.length; i++){
				elem0 = doc1.select(valArr1[i]);
				str0 = elem0.attr("src");
				crawlMap.put(keyArr1[i], str0);
			};
			
			crawlList.clear();
			listSelect = doc.select(".aside_popular tbody tr");
			listSize = listSelect.size();
			Elements elem1 = null;
			String str1 = null;
			Element elem2 = null;
			String str2 = null;
			Element elem3 = null;
			String str3 = null;
			String str4 = null;
			String str5 = null;
			String code[] = null;
			for(int i=0; i < listSize; i++){
				elem1 = listSelect.get(i).select("th a");
				str1 = elem1.text();
				str5 = elem1.attr("href");
				code = str5.split("=");
				
				elem2 = listSelect.get(i).select("td").get(0);
				str2 = elem2.text();
				
				elem3 = listSelect.get(i).select("td").get(1);
				str3 = elem3.text();
				
				str4 = listSelect.get(i).attr("class");
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("stockName", str1);
				tempMap.put("stockNum1", str2);
				tempMap.put("stockNum2", str3);
				tempMap.put("stockStatus", str4);
				tempMap.put("stockCode", code[1]);
				crawlList.add(tempMap);
			}
			String newsURL = "https://finance.naver.com/news/mainnews.nhn";
			Document newsDoc = Jsoup.connect(newsURL).get();
			Elements newsListSelect = newsDoc.select(".newsList li");
			Elements newsElem = null;
			String newsStr = null;
			String newsStr1 = null;
			List<Object> newsList = new ArrayList<Object>();
			int newsSize = newsListSelect.size();
			
			for(int i=0; i < newsSize; i++){
				if(i>=6){break;}
				newsElem = newsListSelect.get(i).select(".articleSubject a");
				newsStr = newsElem.text();
				newsStr1 = newsElem.attr("href");
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("newsTitle", newsStr);
				tempMap.put("newsLink", newsStr1);
				newsList.add(tempMap);
			}
			
			List<Object> stockList1 = new ArrayList<Object>();
			Elements listSelect1 = doc1.select("#siselist_tab_5 tbody tr");
			Elements tabElem1_1 = null;
			String tabStr1_1 = null;
			String tabStr1_2 = null;
			String code1_1[] = null;
			
			Element tabElem1_2 = null;
			String tabStr1_3 = null;
			
			Element tabElem1_3 = null;
			String tabStr1_4 = null;
			
			Element tabElem1_4 = null;
			String tabStr1_5 = null;
			
			String tabStr1_6 = null;
			for(int i=2; i < 11; i++){
				if(i == 7 || i == 8 || i == 9) continue;
				tabElem1_1 = listSelect1.get(i).select("td").get(1).select("a");
				tabStr1_1 = tabElem1_1.text();
				tabStr1_2 = tabElem1_1.attr("href");
				code1_1 = tabStr1_2.split("=");
				
				tabElem1_2 = listSelect1.get(i).select("td").get(2);
				tabStr1_3 = tabElem1_2.text();
				
				tabElem1_3 = listSelect1.get(i).select("td").get(3).select("span").last();
				tabStr1_4 = tabElem1_3.text();
				if(tabElem1_3.hasClass("red01")){
					tabStr1_6 = "up";
				}else if(tabElem1_3.hasClass("nv01")){
					tabStr1_6 = "down";
				}else{
					tabStr1_6 = "same";
				}
				
				tabElem1_4 = listSelect1.get(i).select("td").get(4);
				tabStr1_5 = tabElem1_4.text();
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("stockName", tabStr1_1);
				tempMap.put("stockNum1", tabStr1_3);
				tempMap.put("stockNum2", tabStr1_4);
				tempMap.put("stockNum3", tabStr1_5);
				tempMap.put("stockStatus", tabStr1_6);
				tempMap.put("stockCode", code1_1[1]);
				stockList1.add(tempMap);
			}
			
			List<Object> stockList2 = new ArrayList<Object>();
			Elements listSelect2 = doc1.select("#siselist_tab_7 tbody tr");
			Elements tabElem2_1 = null;
			String tabStr2_1 = null;
			String tabStr2_2 = null;
			String code2_1[] = null;
			
			Element tabElem2_2 = null;
			String tabStr2_3 = null;
			
			Element tabElem2_3 = null;
			String tabStr2_4 = null;
			
			Element tabElem2_4 = null;
			String tabStr2_5 = null;
			
			String tabStr2_6 = null;
			for(int i=2; i < 11; i++){
				if(i == 7 || i == 8 || i == 9) continue;
				tabElem2_1 = listSelect2.get(i).select("td").get(1).select("a");
				tabStr2_1 = tabElem2_1.text();
				tabStr2_2 = tabElem2_1.attr("href");
				code2_1 = tabStr2_2.split("=");
				
				tabElem2_2 = listSelect2.get(i).select("td").get(2);
				tabStr2_3 = tabElem2_2.text();
				
				tabElem2_3 = listSelect2.get(i).select("td").get(3).select("span").last();
				tabStr2_4 = tabElem2_3.text();
				if(tabElem2_3.hasClass("red01")){
					tabStr2_6 = "up";
				}else if(tabElem2_3.hasClass("nv01")){
					tabStr2_6 = "down";
				}else{
					tabStr2_6 = "same";
				}
				
				tabElem2_4 = listSelect2.get(i).select("td").get(4);
				tabStr2_5 = tabElem2_4.text();
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("stockName", tabStr2_1);
				tempMap.put("stockNum1", tabStr2_3);
				tempMap.put("stockNum2", tabStr2_4);
				tempMap.put("stockNum3", tabStr2_5);
				tempMap.put("stockStatus", tabStr2_6);
				tempMap.put("stockCode", code2_1[1]);
				stockList2.add(tempMap);
			}
			
			List<Object> stockList3 = new ArrayList<Object>();
			Elements listSelect3 = doc1.select("#siselist_tab_2 tbody tr");
			Elements tabElem3_1 = null;
			String tabStr3_1 = null;
			String tabStr3_2 = null;
			String code3_1[] = null;
			
			Element tabElem3_2 = null;
			String tabStr3_3 = null;
			
			Element tabElem3_3 = null;
			String tabStr3_4 = null;
			
			Element tabElem3_4 = null;
			String tabStr3_5 = null;
			
			String tabStr3_6 = null;
			for(int i=2; i < 11; i++){
				if(i == 7 || i == 8 || i == 9) continue;
				
				tabElem3_1 = listSelect3.get(i).select("td").get(1).select("a");
				tabStr3_1 = tabElem3_1.text();
				tabStr3_2 = tabElem3_1.attr("href");
				code3_1 = tabStr3_2.split("=");
				
				tabElem3_2 = listSelect3.get(i).select("td").get(2);
				tabStr3_3 = tabElem3_2.text();
				
				tabElem3_3 = listSelect3.get(i).select("td").get(3).select("span").last();
				tabStr3_4 = tabElem3_3.text();
				if(tabElem3_3.hasClass("red01")){
					tabStr3_6 = "up";
				}else if(tabElem3_3.hasClass("nv01")){
					tabStr3_6 = "down";
				}else{
					tabStr3_6 = "same";
				}
				
				tabElem3_4 = listSelect3.get(i).select("td").get(4);
				tabStr3_5 = tabElem3_4.text();
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("stockName", tabStr3_1);
				tempMap.put("stockNum1", tabStr3_3);
				tempMap.put("stockNum2", tabStr3_4);
				tempMap.put("stockNum3", tabStr3_5);
				tempMap.put("stockStatus", tabStr3_6);
				tempMap.put("stockCode", code3_1[1]);
				stockList3.add(tempMap);
			}
			
			List<Object> stockList4 = new ArrayList<Object>();
			Elements listSelect4 = doc1.select("#siselist_tab_4 tbody tr");
			Elements tabElem4_1 = null;
			String tabStr4_1 = null;
			String tabStr4_2 = null;
			String code4_1[] = null;
			
			Element tabElem4_2 = null;
			String tabStr4_3 = null;
			
			Element tabElem4_3 = null;
			String tabStr4_4 = null;
			
			Element tabElem4_4 = null;
			String tabStr4_5 = null;
			
			String tabStr4_6 = null;
			for(int i=2; i < 11; i++){
				if(i == 7 || i == 8 || i == 9) continue;
				
				tabElem4_1 = listSelect4.get(i).select("td").get(1).select("a");
				tabStr4_1 = tabElem4_1.text();
				tabStr4_2 = tabElem4_1.attr("href");
				code4_1 = tabStr4_2.split("=");
				
				tabElem4_2 = listSelect4.get(i).select("td").get(2);
				tabStr4_3 = tabElem4_2.text();
				
				tabElem4_3 = listSelect4.get(i).select("td").get(3).select("span").last();
				tabStr4_4 = tabElem4_3.text();
				if(tabElem4_3.hasClass("red01")){
					tabStr4_6 = "up";
				}else if(tabElem4_3.hasClass("nv01")){
					tabStr4_6 = "down";
				}else{
					tabStr4_6 = "same";
				}
				
				tabElem4_4 = listSelect4.get(i).select("td").get(4);
				tabStr4_5 = tabElem4_4.text();
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("stockName", tabStr4_1);
				tempMap.put("stockNum1", tabStr4_3);
				tempMap.put("stockNum2", tabStr4_4);
				tempMap.put("stockNum3", tabStr4_5);
				tempMap.put("stockStatus", tabStr4_6);
				tempMap.put("stockCode", code4_1[1]);
				stockList4.add(tempMap);
			}
			
			List<Object> typeListAll = new ArrayList<Object>();
			Elements typeListSelect = doc.select(".section_top_first .list_rank li");
			int typeSize = typeListSelect.size();
			Element typeElem = null;
			Elements typeElem1 = null;
			Elements typeElem2 = null;
			String typeStr = null;
			String typeStr1 = null;
			String typeCode[] = null;
			String typeStr2 = null;
			String typeStr3 = null;
			
			for(int i=0; i < typeSize; i++){
				List<Object> typeList = new ArrayList<Object>();
				for(int j=0; j< typeListSelect.get(i).select("p").size(); j++){
					typeElem = typeListSelect.get(i).select("p").get(j);
					if(typeElem != null){
						typeElem1 = typeElem.select("a");
						typeStr = typeElem1.text();
						typeStr1 = typeElem1.attr("href");
						typeCode = typeStr1.split("=");
						typeElem2 = typeElem.select("em");
						typeStr2 = typeElem2.text();
						typeStr3 = typeElem2.attr("class");
						
						Map<String, Object> tempMap = new HashMap<String, Object>();
						tempMap.put("stockName", typeStr);
						tempMap.put("stockNum", typeStr2);
						tempMap.put("stockStatus", typeStr3);
						tempMap.put("stockCode", typeCode[1]);
						
						typeList.add(tempMap);
					}
				}
				Map<String, Object> tempMap = new HashMap<String, Object>();
				
				tempMap.put("typeList"+i,typeList);
				typeListAll.add(tempMap);
			}
			
			
			List<Object> themeListAll = new ArrayList<Object>();
			Elements themeListSelect = doc.select(".group_top .list_rank li");
			int themeSize = themeListSelect.size();
			Element themeElem = null;
			Elements themeElem1 = null;
			Elements themeElem2 = null;
			String themeStr = null;
			String themeStr1 = null;
			String themeCode[] = null;
			String themeStr2 = null;
			String themeStr3 = null;
			
			for(int i=0; i < themeSize; i++){
				List<Object> themeList = new ArrayList<Object>();
					for(int j=0; j< themeListSelect.get(i).select("p").size(); j++){
						themeElem = themeListSelect.get(i).select("p").get(j);
						if(themeElem != null){
							themeElem1 = themeElem.select("a");
							themeStr = themeElem1.text();
							themeStr1 = themeElem1.attr("href");
							themeCode = themeStr1.split("=");
							themeElem2 = themeElem.select("em");
							themeStr2 = themeElem2.text();
							themeStr3 = themeElem2.attr("class");
							
							Map<String, Object> tempMap = new HashMap<String, Object>();
							tempMap.put("stockName", themeStr);
							tempMap.put("stockNum", themeStr2);
							tempMap.put("stockStatus", themeStr3);
							tempMap.put("stockCode", themeCode[1]);
							
							themeList.add(tempMap);
						}
					}
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("themeList"+i,themeList);
				themeListAll.add(tempMap);
			}
			
			crawlMap.put("stockList",crawlList);
			crawlMap.put("newsList",newsList);
			crawlMap.put("stockList1",stockList1);
			crawlMap.put("stockList2",stockList2);
			crawlMap.put("stockList3",stockList3);
			crawlMap.put("stockList4",stockList4);
			crawlMap.put("typeList",typeListAll);
			crawlMap.put("themeList",themeListAll);
		}
//		main ===>
//		<=== cloud
		if(target.equals("cloud")){
			URL = "https://finance.naver.com/sise/lastsearch2.nhn";
			Document doc = Jsoup.connect(URL).get();
			
			crawlList.clear();
			listSelect = doc.select(".type_5 tr");
			listSize = listSelect.size();
			Elements elem1 = null;
			String str1 = null;
			String str2 = null;
			String code[] = null;
			Elements elem2 = null;
			String str3 = null;
			String str4 = null;
			for(int i=0; i < listSize; i++){
				if(i == 0 || i == 1 || i == 7 || i == 8 || i == 9 || i == 15 || i == 16 || i == 17 || i == 23 || i == 24 || i == 25 || i == 31 || i == 32 || i == 33 || i == 39 || i == 40 || i == 41 || i == 47 || i == 48 || i == 49) continue;
				
				elem1 = listSelect.get(i).select("td").get(1).select("a");
				str1 = elem1.text();
				str2 = elem1.attr("href");
				code = str2.split("=");
				
				elem2 = listSelect.get(i).select("td").get(5).select("span");
				str3 = elem2.text();
				
				if(elem2.hasClass("red01")){
					str4 = "up";
				}else if(elem2.hasClass("nv01")){
					str4 = "down";
				}else{
					str4 = "same";
				}
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("stockName", str1);
				tempMap.put("stockNum1", str3);
				tempMap.put("stockStatus", str4);
				tempMap.put("stockCode", code[1]);
				crawlList.add(tempMap);
			}
			crawlMap.put("cloudList", crawlList);
		}
//		cloud ===>
//		<=== stockDetail
		if(target.equals("stockDetail")){
			URL = "https://finance.naver.com/item/main.nhn?"+stockCode;
			String URL2 = "https://finance.naver.com/item/coinfo.nhn?"+stockCode;
			String URL3 = "https://navercomp.wisereport.co.kr/v2/company/c1010001.aspx?cmp_cd="+stockCode.split("=")[1];
			String URL4 = "https://navercomp.wisereport.co.kr/v2/company/c1020001.aspx?cmp_cd="+stockCode.split("=")[1];
			String URL5 = "https://finance.naver.com/item/frgn.nhn?"+stockCode;
			
			Document doc = Jsoup.connect(URL).get();
			Document doc2 = Jsoup.connect(URL2).get();
			Document doc3 = Jsoup.connect(URL3).get();
			Document doc4 = Jsoup.connect(URL4).get();
			Document doc5 = Jsoup.connect(URL5).get();
			
			elem = doc.select(".wrap_company h2");
			str = elem.text();
			String[] temp = stockCode.split("=");
			
			Elements elem1 = doc.select("#time");
			String str1 = elem1.text();
			
			Element elem2 = doc.select("#summary_info p").get(0);
			Element elem3 = doc.select("#summary_info p").get(1);
			Element elem4 = doc.select("#summary_info p").get(2);
			
			String str2 = elem2.text();
			String str3 = elem3.text();
			String str4 = elem4.text();
			
			Elements elem5 = doc.select(".no_today");
			Elements elem6 = doc.select(".no_today em");
			String str5 = elem5.text();
			String[] temp2 = str5.split(" "); 
			String str6 = elem6.attr("class");
			
			Element elem7 = doc.select(".no_exday em").get(0);
			Element elem8 = doc.select(".no_exday em").get(1);
			String str7 = elem7.text();
			String[] temp3 = str7.split(" "); 
			
			String str8 = elem8.text();
			String[] temp4 = str8.split(" "); 
			
			Element elem9 = doc.select(".no_info tr").get(0);
			
			Element elem10 = elem9.select("td").get(0);
			String[] temp5 = elem10.text().split(" ");
			
			Element elem11 = elem9.select("td").get(1);
			
			Element elem12 = elem11.select("em").get(0);
			String[] temp6 = elem12.select("span").text().split(" ");
			String str9 = elem12.attr("class");
			
			Element elem13 = elem11.select("em").get(1);
			String[] temp7 = elem13.select("span").text().split(" ");
			
			Element elem21 = elem9.select("td").get(2);
			
			Element elem14 = elem21.select("em").get(0);
			String[] temp8 = elem14.select("span").text().split(" ");
			
			
			
			Element elem15 = doc.select(".no_info tr").get(1);
			
			Elements elem16 = elem15.select("td").get(0).select("em");
			String[] temp9 = elem16.select("span").text().split(" ");
			String str11 = elem16.attr("class");
			
			Element elem17 = elem15.select("td").get(1);
			
			Element elem18 = elem17.select("em").get(0);
			String[] temp10 = elem18.select("span").text().split(" ");
			String str12 = elem18.attr("class");
			
			Element elem19 = elem17.select("em").get(1);
			String temp11 = elem19.text();
			
			Element elem22 = elem15.select("td").get(2);
			
			Element elem20 = elem22.select("em").get(0);
			String[] temp12 = elem20.select("span").text().split(" ");
			
			String str13 = doc2.select("#_eps").text();
			
			Elements helper1 = doc2.select("#helpPannel1");
			helper1.select("strong").remove();
			String helper1_1 = helper1.text();
			
			Elements helper2 = doc2.select("#helpPannel4");
			helper2.select("strong").remove();
			String helper2_1 = helper2.text();
			
			Elements helper3 = doc2.select("#helpPannel5");
			String helper3_1 = helper3.select("strong").text();
			helper3.select("strong").remove();
			String helper3_2 = helper3.text();
			
			
			Element elem24 = doc2.select(".per_table tbody").get(1);
			Element elem25 = elem24.select("tr").get(1).select("em").get(1);
			String str14 = elem25.text();
			String str15 = doc2.select("#_per").text();
			String str16 = doc2.select("#tab_con1 div").last().select("tbody tr").get(0).select("td").text();
			String str17 = elem24.select("tr").get(1).select("em").get(0).text();
			String str18 = doc2.select("#_dvr").text();
			
			String str19 = doc.select("#img_chart_area").attr("src").split("/")[8];
			String str20 = "https://ssl.pstatic.net/imgfinance/chart/item/area/day/" + str19;
			String str21 = "https://ssl.pstatic.net/imgfinance/chart/item/area/week/" + str19;
			String str22 = "https://ssl.pstatic.net/imgfinance/chart/item/area/month3/" + str19;
			String str23 = "https://ssl.pstatic.net/imgfinance/chart/item/area/year/" + str19;
			String str24 = "https://ssl.pstatic.net/imgfinance/chart/item/area/year3/" + str19;
			String str25 = "https://ssl.pstatic.net/imgfinance/chart/item/area/year5/" + str19;
			String str26 = "https://ssl.pstatic.net/imgfinance/chart/item/area/year10/" + str19;
			String str27 = "https://ssl.pstatic.net/imgfinance/chart/item/candle/day/" + str19;
			String str28 = "https://ssl.pstatic.net/imgfinance/chart/item/candle/week/" + str19;
			String str29 = "https://ssl.pstatic.net/imgfinance/chart/item/candle/month/" + str19;
			
			String str30 = doc3.select(".td0101 dt").get(3).text().split(":")[1];
			String str31 = doc4.select("#cTB201 tbody tr").get(0).select("td").text();
			String str32 = doc4.select("#cTB201 tbody tr").get(1).select("a").text();
			String str33 = doc4.select("#cTB201 tbody tr").get(1).select("td").last().text();
			String str34 = doc4.select("#cTB201 tbody tr").get(2).select("td").first().text();
			String str35 = doc4.select("#cTB201 tbody tr").get(2).select("td").last().text();
			String str36 = doc4.select("#cTB201 tbody tr").get(3).select("td").first().text();
			String str37 = doc4.select("#cTB201 tbody tr").get(3).select("td").last().text();
			String str38 = doc4.select("#cTB201 tbody tr").get(5).select("td").last().text();
			
			String str39 = doc3.select("#cTB11 tbody tr").get(0).select("td").select("strong").text();
			String str40 = doc3.select("#cTB11 tbody tr").get(0).select("td").select("span").first().text();
			String str41 = doc3.select("#cTB11 tbody tr").get(0).select("td").select("span").last().text();
			String str42 = doc3.select("#cTB11 tbody tr").get(0).select("td").select("span").first().attr("class");
			String str43 = doc3.select("#cTB11 tbody tr").get(0).select("td").select("span").last().attr("class");
			String[] str44 = doc3.select("#cTB11 tbody tr").get(1).select("td").text().split("/");
			String str45 = doc3.select("#cTB11 tbody tr").get(2).select("td").text();
			String[] str46 = doc3.select("#cTB11 tbody tr").get(3).select("td").text().split("/");
			String str47 = doc3.select("#cTB11 tbody tr").get(4).select("td").text();
			String str48 = doc3.select("#cTB11 tbody tr").get(5).select("td").text();
			String[] str49 = doc3.select("#cTB11 tbody tr").get(6).select("td").text().split("/");
			String str50 = doc3.select("#cTB11 tbody tr").get(7).select("td").text();
			String str51 = doc3.select("#cTB11 tbody tr").get(8).select("td").select("span").first().text();
			String str52 = doc3.select("#cTB11 tbody tr").get(8).select("td").select("span").get(1).text();
			String str53 = doc3.select("#cTB11 tbody tr").get(8).select("td").select("span").get(2).text();
			String str54 = doc3.select("#cTB11 tbody tr").get(8).select("td").select("span").last().text();
			String str55 = doc3.select("#cTB11 tbody tr").get(8).select("td").select("span").first().attr("class");
			String str56 = doc3.select("#cTB11 tbody tr").get(8).select("td").select("span").get(1).attr("class");
			String str57 = doc3.select("#cTB11 tbody tr").get(8).select("td").select("span").get(2).attr("class");
			String str58 = doc3.select("#cTB11 tbody tr").get(8).select("td").select("span").last().attr("class");
			
			
			String newsChk;
			if(doc.select(".news_section").select("ul").size() == 0){
				newsChk = "n";
			}else{
				newsChk = "y";
				Element newsListSelect1 = doc.select(".news_section ul").first();
				Element newsElem = null;
				String newsStr = null;
				String newsStr1 = null;
				List<Object> newsList = new ArrayList<Object>();
				int newsSize = newsListSelect1.select("li").size();
				for(int i=0; i < newsSize; i++){
					if(i>=6){break;}
					newsElem = newsListSelect1.select("li").get(i).select("a").first();
					newsStr = newsElem.text();
					newsStr1 = newsElem.attr("href");
					
					Map<String, Object> tempMap = new HashMap<String, Object>();
					tempMap.put("newsTitle", newsStr);
					tempMap.put("newsLink", newsStr1);
					newsList.add(tempMap);
				}
				crawlMap.put("newsList", newsList);
			}
			
			String forumChk;
			if(doc.select(".new_bbs .right").select("ul").size() == 0){
				forumChk = "n";
			}else{
				forumChk = "y";
				Element forumListSelect1 = doc.select(".new_bbs .right ul").first();
				Element forumElem = null;
				String forumStr = null;
				String forumStr1 = null;
				List<Object> forumList = new ArrayList<Object>();
				
				for(int i=0; i < 5; i++){
					forumElem = forumListSelect1.select("li").get(i).select("a").first();
					forumStr = forumElem.text();
					forumStr1 = forumElem.attr("href");
					
					Map<String, Object> tempMap = new HashMap<String, Object>();
					tempMap.put("forumTitle", forumStr);
					tempMap.put("forumLink", forumStr1);
					forumList.add(tempMap);
				}
				crawlMap.put("forumList", forumList);
			}
			String graphImg1 = doc5.select("#frgn_chart_0 .graph img").last().attr("src");
			String graphImg2 = doc5.select("#frgn_chart_1 .graph img").last().attr("src");
			String graphImg3 = doc5.select("#frgn_chart_2 .graph img").last().attr("src");
			String graphImg4 = doc5.select("#frgn_chart_3 .graph img").last().attr("src");
			
			String graphImg5 = doc5.select("#organ_chart_0 .graph img").last().attr("src");
			String graphImg6 = doc5.select("#organ_chart_1 .graph img").last().attr("src");
			String graphImg7 = doc5.select("#organ_chart_2 .graph img").last().attr("src");
			String graphImg8 = doc5.select("#organ_chart_3 .graph img").last().attr("src");
			
			Element elem26 = doc3.select("#cTB15 tr").last();
			String investChk;
			
			if(doc3.select("#pointer").size() == 0){
				investChk = "n";
			}else{
				investChk = "y";
				
				String[] investPoint = doc3.select("#pointer").attr("style").split(" ");
				String investNum1 = elem26.select("td").get(0).text(); 
				String investNum2 = elem26.select("td").get(1).text(); 
				String investNum3 = elem26.select("td").get(2).text(); 
				String investNum4 = elem26.select("td").get(3).text(); 
				String investNum5 = elem26.select("td").get(4).text(); 
				
				crawlMap.put("investPoint", investPoint[1]);
				crawlMap.put("investNum1", investNum1);
				crawlMap.put("investNum2", investNum2);
				crawlMap.put("investNum3", investNum3);
				crawlMap.put("investNum4", investNum4);
				crawlMap.put("investNum5", investNum5);
				
				if(doc3.select("#cTB24 tbody tr").size()>=1){
					
					Element elem27 = doc3.select("#cTB24 tbody tr").get(0);
					String investNum6_1 = elem27.select("td").get(0).text();
					String investNum6_2 = elem27.select("td").get(1).text();
					String investNum6_3 = elem27.select("td").get(2).text();
					String investNum6_4 = elem27.select("td").get(3).text();
					String investNum6_5 = elem27.select("td").get(4).text();
					String investNum6_6 = elem27.select("td").get(5).text();
					String investNum6_7 = elem27.select("td").get(6).text();
					
					crawlMap.put("investNum6_1", investNum6_1);
					crawlMap.put("investNum6_2", investNum6_2);
					crawlMap.put("investNum6_3", investNum6_3);
					crawlMap.put("investNum6_4", investNum6_4);
					crawlMap.put("investNum6_5", investNum6_5);
					crawlMap.put("investNum6_6", investNum6_6);
					crawlMap.put("investNum6_7", investNum6_7);
				}
				
				if(doc3.select("#cTB24 tbody tr").size()>=2){
					Element elem28 = doc3.select("#cTB24 tbody tr").get(1);
					String investNum7_1 = elem28.select("td").get(0).text();
					String investNum7_2 = elem28.select("td").get(1).text();
					String investNum7_3 = elem28.select("td").get(2).text();
					String investNum7_4 = elem28.select("td").get(3).text();
					String investNum7_5 = elem28.select("td").get(4).text();
					String investNum7_6 = elem28.select("td").get(5).text();
					String investNum7_7 = elem28.select("td").get(6).text();
					
					crawlMap.put("investNum7_1", investNum7_1);
					crawlMap.put("investNum7_2", investNum7_2);
					crawlMap.put("investNum7_3", investNum7_3);
					crawlMap.put("investNum7_4", investNum7_4);
					crawlMap.put("investNum7_5", investNum7_5);
					crawlMap.put("investNum7_6", investNum7_6);
					crawlMap.put("investNum7_7", investNum7_7);
				}
				
				if(doc3.select("#cTB24 tbody tr").size()>=3){
					Element elem29 = doc3.select("#cTB24 tbody tr").get(2);
					String investNum8_1 = elem29.select("td").get(0).text();
					String investNum8_2 = elem29.select("td").get(1).text();
					String investNum8_3 = elem29.select("td").get(2).text();
					String investNum8_4 = elem29.select("td").get(3).text();
					String investNum8_5 = elem29.select("td").get(4).text();
					String investNum8_6 = elem29.select("td").get(5).text();
					String investNum8_7 = elem29.select("td").get(6).text();
					
					crawlMap.put("investNum8_1", investNum8_1);
					crawlMap.put("investNum8_2", investNum8_2);
					crawlMap.put("investNum8_3", investNum8_3);
					crawlMap.put("investNum8_4", investNum8_4);
					crawlMap.put("investNum8_5", investNum8_5);
					crawlMap.put("investNum8_6", investNum8_6);
					crawlMap.put("investNum8_7", investNum8_7);
				}
			}
			
			crawlMap.put("stockName",str);
			crawlMap.put("stockCode",temp[1]);
			crawlMap.put("time",str1);
			crawlMap.put("stockDesc1",str2);
			crawlMap.put("stockDesc2",str3);
			crawlMap.put("stockDesc3",str4);
			crawlMap.put("todayNum",temp2[0]);
			crawlMap.put("todayStatus",str6);
			crawlMap.put("exdayNum1",temp3[1]);
			if(elem8.attr("class").equals("X")){
				crawlMap.put("exdayNum2",temp4[0]+"%");
			}else{
				crawlMap.put("exdayNum2",temp4[0]+temp4[2]+temp4[3]);
			}
			crawlMap.put("noInfo1",temp5[2]);
			crawlMap.put("noInfo2",temp6[0]);
			crawlMap.put("noInfo2_Status",str9);
			crawlMap.put("noInfo3",temp7[0]);
			crawlMap.put("noInfo4",temp8[0]);
			crawlMap.put("noInfo5",temp9[0]);
			crawlMap.put("noInfo5_Status",str11);
			crawlMap.put("noInfo6",temp10[0]);
			crawlMap.put("noInfo6_Status",str12);
			crawlMap.put("noInfo7",temp11);
			crawlMap.put("noInfo8",temp12[0]);
			crawlMap.put("helper1",helper1_1);
			crawlMap.put("helper2",helper2_1);
			crawlMap.put("helper3_1",helper3_1);
			crawlMap.put("helper3_2",helper3_2);
			
			
			crawlMap.put("dtNum1",str13);
			crawlMap.put("dtNum2",str14);
			crawlMap.put("dtNum3",str15);
			crawlMap.put("dtNum4",str16);
			crawlMap.put("dtNum5",str17);
			crawlMap.put("dtNum6",str18);
			
			crawlMap.put("chartImg1",str20);
			crawlMap.put("chartImg2",str21);
			crawlMap.put("chartImg3",str22);
			crawlMap.put("chartImg4",str23);
			crawlMap.put("chartImg5",str24);
			crawlMap.put("chartImg6",str25);
			crawlMap.put("chartImg7",str26);
			crawlMap.put("chartImg8",str27);
			crawlMap.put("chartImg9",str28);
			crawlMap.put("chartImg10",str29);
			
			crawlMap.put("comDesc",str30);
			crawlMap.put("comDesc1", str31);
			crawlMap.put("comDesc2", str32);
			crawlMap.put("comDesc3", str33);
			crawlMap.put("comDesc4", str34);
			crawlMap.put("comDesc5", str35);
			crawlMap.put("comDesc6", str36);
			crawlMap.put("comDesc7", str37);
			crawlMap.put("comDesc8", str38);
			
			crawlMap.put("comSise1", str39);
			crawlMap.put("comSise2", str40);
			crawlMap.put("comSise3", str41);
			crawlMap.put("comSise2_1", str42);
			crawlMap.put("comSise3_1", str43);
			crawlMap.put("comSise4", str44[0]);
			crawlMap.put("comSise5", str44[1]);
			crawlMap.put("comSise6", str45);
			crawlMap.put("comSise7", str46[0]);
			crawlMap.put("comSise8", str46[1]);
			crawlMap.put("comSise9", str47);
			crawlMap.put("comSise10", str48);
			crawlMap.put("comSise11", str49[0]);
			crawlMap.put("comSise12", str49[1]);
			crawlMap.put("comSise13", str50);
			crawlMap.put("comSise14", str51);
			crawlMap.put("comSise15", str52);
			crawlMap.put("comSise16", str53);
			crawlMap.put("comSise17", str54);
			crawlMap.put("comSise14_1", str55);
			crawlMap.put("comSise15_1", str56);
			crawlMap.put("comSise16_1", str57);
			crawlMap.put("comSise17_1", str58);
			
			crawlMap.put("graphImg1", graphImg1);
			crawlMap.put("graphImg2", graphImg2);
			crawlMap.put("graphImg3", graphImg3);
			crawlMap.put("graphImg4", graphImg4);
			crawlMap.put("graphImg5", graphImg5);
			crawlMap.put("graphImg6", graphImg6);
			crawlMap.put("graphImg7", graphImg7);
			crawlMap.put("graphImg8", graphImg8);
			
			crawlMap.put("investChk", investChk);
			crawlMap.put("newsChk", newsChk);
			crawlMap.put("forumChk", forumChk);
		}
//		stockDetail ===>

		
		return crawlMap;
	}

//	<=== side
	public Map<String,Object> crawlSide() throws Exception{
		String sideURL = "";
		Elements sideElem = null;
		String sideStr = null;	
		Elements sideListSelect = null;
		int sideListSize = 0;
		Map<String, Object> sideMap = new HashMap<String, Object>();
		List<Object> sideList = new ArrayList<Object>();
		
		sideURL = "https://finance.naver.com/";
		Document doc = Jsoup.connect(sideURL).get();
		String[] keyArr = {"kospiTitle","kospiNum1","kospiNum2","kospiNum3","kospiImg","kosdaqTitle","kosdaqNum1","kosdaqNum2","kosdaqNum3","kosdaqImg","kospi200Title","kospi200Num1","kospi200Num2","kospi200Num3","kospi200Img","kospiStatus","kosdaqStatus","kospi200Status"};
		String[] valArr = {".kospi_area .heading_area em .blind", ".kospi_area .heading_area .num", ".kospi_area .heading_area .num2", ".kospi_area .heading_area .num3",".kospi_area img",".kosdaq_area .heading_area em .blind", ".kosdaq_area .heading_area .num", ".kosdaq_area .heading_area .num2", ".kosdaq_area .heading_area .num3",".kosdaq_area img",".kospi200_area .heading_area em .blind", ".kospi200_area .heading_area .num", ".kospi200_area .heading_area .num2", ".kospi200_area .heading_area .num3",".kospi200_area img",".kospi_area .heading_area .num_quot > .blind",".kosdaq_area .heading_area .num_quot > .blind",".kospi200_area .heading_area .num_quot > .blind"};
		
		for(int i=0; i<keyArr.length; i++){
			sideElem = doc.select(valArr[i]);
			
			if(sideElem.is("img")){
				sideStr = sideElem.attr("src");
			}else{
				sideStr = sideElem.text();
			}
			
			sideMap.put(keyArr[i], sideStr);
		}
		
		sideList.clear();
		sideListSelect = doc.select(".aside_popular tbody tr");
		sideListSize = sideListSelect.size();
		Elements elem1 = null;
		String str1 = null;
		Element elem2 = null;
		String str2 = null;
		Element elem3 = null;
		String str3 = null;
		String str4 = null;
		String str5 = null;
		String code[] = null;
		for(int i=0; i < sideListSize; i++){
			elem1 = sideListSelect.get(i).select("th a");
			str1 = elem1.text();
			str5 = elem1.attr("href");
			code = str5.split("=");
			
			elem2 = sideListSelect.get(i).select("td").get(0);
			str2 = elem2.text();
			
			elem3 = sideListSelect.get(i).select("td").get(1);
			str3 = elem3.text();
			
			str4 = sideListSelect.get(i).attr("class");
			
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("stockName", str1);
			tempMap.put("stockNum1", str2);
			tempMap.put("stockNum2", str3);
			tempMap.put("stockStatus", str4);
			tempMap.put("stockCode", code[1]);
			sideList.add(tempMap);
		}
		sideMap.put("stockList",sideList);
		return sideMap;
	}
}