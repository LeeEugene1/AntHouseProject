package kr.or.redant.user.stockForum.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.vo.QNAboardVO;
import kr.or.redant.vo.StockForumVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IStockForumDaoImpl implements IStockForumDao {
	
	@Autowired
	private SqlMapClient client; 
	
	@Override
    public StockForumVO stockForumInfo(Map<String, String> params) throws Exception {
		StockForumVO stockForumInfo = null;
		
		try {
			client.startTransaction();
			client.update("stockForum.updateHIT", params);
			stockForumInfo = (StockForumVO) client.queryForObject("stockForum.stockForumInfo",params);
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		
       return stockForumInfo;
    }

	@Override
	public List<StockForumVO> stockForumList(Map<String, String> params) throws Exception {
		return client.queryForList("stockForum.stockForumList", params);
	}

	@Override
	public String insertStockForumInfo(StockForumVO stockForumInfo)
			throws Exception {
		return (String) client.insert("stockForum.insertStockForum", stockForumInfo);
	}

	@Override
	public void updateStockForumInfo(StockForumVO stockForumInfo)
			throws Exception {
		client.update("stockForum.updateStockForum", stockForumInfo);
	}

	@Override
	public void deleteStockForumInfo(Map<String, String> params)
			throws Exception {
		client.update("stockForum.deleteStockForum", params);
	}

	@Override
	public String insertStockForumReply(StockForumVO stockForumInfo)
			throws Exception {
		try{
			client.startTransaction();
			
			String sf_seq;
			if("0".intern() == stockForumInfo.getSf_seq().intern()){
				sf_seq = (String) client.queryForObject("stockForum.incrementSEQ", stockForumInfo);
			}else{
				client.update("stockForum.updateSEQ", stockForumInfo);
				sf_seq = String.valueOf(Integer.parseInt(stockForumInfo.getSf_seq())+1);
			}
			stockForumInfo.setSf_seq(sf_seq);
			
			String sf_depth = String.valueOf(Integer.parseInt(stockForumInfo.getSf_depth())+1);
			stockForumInfo.setSf_depth(sf_depth);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return (String) client.insert("stockForum.insertStockForumReply",stockForumInfo);
	}
	
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("stockForum.totalCount",params);
	}

}
