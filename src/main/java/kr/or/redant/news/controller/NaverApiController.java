package kr.or.redant.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.InputStreamReader;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import kr.or.redant.vo.NewsVO;
@Controller
@RequestMapping("/newsSearch/")
public class NaverApiController {
	private String clientId = "NYzMGMVPYaZ56Va3sG5A"; //애플리케이션 클라이언트 아이디값"
    private String clientSecret = "sPtIneuOdT"; //애플리케이션 클라이언트 시크릿값"
    
    public List<NewsVO> searchNews(String keyword, int display, int start){
    	URL url;
    	List<NewsVO> list = null;
    	try{
    		url = new URL("https://openapi.naver.com/v1/search/news.json?query=" + URLEncoder.encode(keyword, "utf-8")
    						+(display !=0 ? "&display="+display :"")+(start !=0?"&start=" + start : ""));
    		URLConnection urlConn = null;
    		
    		//url연결
    		 XmlPullParserFactory factory; 
    		 
             factory = XmlPullParserFactory.newInstance();
             XmlPullParser parser = factory.newPullParser();
             parser.setInput((new InputStreamReader(urlConn.getInputStream())));

             int eventType = parser.getEventType();
             NewsVO news = null;

             while (eventType != XmlPullParser.END_DOCUMENT) {
                 switch (eventType) {
                 case XmlPullParser.END_DOCUMENT: // 문서의 끝
                     break;
                 case XmlPullParser.START_DOCUMENT:
                     list = new ArrayList<NewsVO>();
                     break;
                 case XmlPullParser.START_TAG: {
                     String tag = parser.getName();
                     switch (tag) {
                     case "item":
                    	 news = new NewsVO();
                         break;
                     case "title":
                         if (news != null)
                        	 news.setTitle(parser.nextText());
                         break;
                     case "link":
                         if (news != null && news.getLink().contains("sid1=101"))
                        	 news.setLink(parser.nextText());
                         break;
                     case "originallink":
                         if (news != null)
                        	 news.setOriginallink(parser.nextText());
                         break;
                     case "pubdate":
                         if (news != null)
                        	 news.setPubDate(parser.nextText());;
                         break;
                     case "description":
                         if (news != null)
                        	 news.setDescription(parser.nextText());
                         break;
                     }
                     break;
                 }
  
                 case XmlPullParser.END_TAG: {
                     String tag = parser.getName();
                     if (tag.equals("item")) {
                         list.add(news);
                         news = null;
                     }
                 }
                 
                 }
                 eventType = parser.next();
             }
    	} catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
}
