package com.green.comment.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.board.vo.BoardVo;
import com.green.comment.dao.CommentDao;
import com.green.comment.vo.CommentVo;

@Repository("commentDao")
public class CommentDaoImpl implements CommentDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void setWrite(HashMap<String, Object> map) {

		sqlSession.insert("Comment.Write", map);
		
	}

	@Override
	public List<CommentVo> setRead(HashMap<String, Object> map) {

		List<CommentVo> commentList = sqlSession.selectList("Comment.ReadComment", map);
		
		return commentList;
	}

	@Override
	public int setDelete(HashMap<String, Object> map) {
		
		sqlSession.delete("Comment.CommentDelNum", map);
		int  childCnt = sqlSession.selectOne("Comment.ChildCnt", map); // 자식있는지 확인
		CommentVo vo = sqlSession.selectOne("Comment.GetComment", map);

		int cnf = 0;
		if ( childCnt == 0) { // 자식이 없는 경우 삭제
			cnf = sqlSession.delete("Comment.DeleteComment", map);
		}
		
		int comment_idx = vo.getCom_parent();
		CommentVo vo1 = sqlSession.selectOne("Comment.GetComment", comment_idx);
		
		childCnt = sqlSession.selectOne("Comment.ChildCnt", vo1);
		if(  childCnt == 0  ) { // 자식이 없는경우 삭제
			
			cnf = sqlSession.delete("Comment.DeleteComment", vo1);
		}
		System.out.println(cnf);
		return cnf;
		
	}

	@Override
	public void reWrite(HashMap<String, Object> map) {
		
		sqlSession.insert("Comment.ReWrite", map);
		
	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {

		CommentVo vo = sqlSession.selectOne("Comment.GetComment", map);
		int board_idx = vo.getBoard_idx();
		map.put("board_idx", board_idx);
		sqlSession.update("Comment.UpdateComment", map);
		
	}

}
