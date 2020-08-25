package kr.spring.search.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.spring.search.domain.MovieVO;
import sun.util.logging.resources.logging;

public class SearchMethod {
	private Logger log=Logger.getLogger(this.getClass());
    static List<MovieVO> get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static List<MovieVO> readBody(InputStream input){
    	
    	List<MovieVO> list=new ArrayList<MovieVO> ();
    	
    	try{
            DocumentBuilder builder =
                    DocumentBuilderFactory.newInstance().newDocumentBuilder();
            Document doc = builder.parse(input);
            NodeList items = doc.getElementsByTagName("item");

            for(int i=0;i<items.getLength();i++){
                Element item = (Element)items.item(i);
                NodeList article=items.item(i).getChildNodes();
                MovieVO movie = new MovieVO();
                for(int j=0;j<article.getLength();j++){
                	Node n=article.item(j);
	                //데이터를 보관할 객체 생성(MovieVO)
	                
	                if(n.getNodeName().equals("title") && n.getFirstChild()!=null){
	                	movie.setTitle(n.getFirstChild().getNodeValue());
                    }
	                if(n.getNodeName().equals("link") && n.getFirstChild()!=null){
	                	 movie.setLink(n.getFirstChild().getNodeValue());
	                }
	                if(n.getNodeName().equals("director") && n.getFirstChild()!=null){
	                		movie.setDirector(n.getFirstChild().getNodeValue());
	                }
	                if(n.getNodeName().equals("image") && n.getFirstChild()!=null){
	                	movie.setImage(n.getFirstChild().getNodeValue());
	                }
	                if(n.getNodeName().equals("actor") && n.getFirstChild()!=null){
	                	movie.setActor(n.getFirstChild().getNodeValue());
	                }
	                if(n.getNodeName().equals("pubDate") && n.getFirstChild()!=null){
	                	movie.setPubDate(n.getFirstChild().getNodeValue());
	                }
	                if(n.getNodeName().equals("userRating") && n.getFirstChild()!=null){
	                	movie.setUserRating(Double.parseDouble(n.getFirstChild().getNodeValue()));
	                }
                }
                list.add(movie);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
		
    	
    	return list;
		
		
    }
}
