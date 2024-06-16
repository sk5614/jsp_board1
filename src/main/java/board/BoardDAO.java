package board;

//import board.BoardDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardDAO {
    private SqlSessionFactory sqlSessionFactory;

    public BoardDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public List<BoardDTO> boardList(int page, int size) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, Integer> params = new HashMap<>();
            
            int offset=(page-1)*size;
            params.put("offset", size);
            params.put("limit", offset);
            return session.selectList("board.BoardDAO.boardList",params); 
        }
    }
    
    public int countBoard() {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("board.BoardDAO.countBoard");
        }
    }
    
    
    public BoardDTO boardInfo(int id) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("board.BoardDAO.boardInfo", id);
        }
    }

    public void writeBoard(BoardDTO board) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            session.insert("board.BoardDAO.writeBoard", board);
            session.update("board.BoardDAO.setGroup");
            session.commit();
        }
    }
    
    public void deleteBoard(BoardDTO board) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            session.delete("board.BoardDAO.deleteBoard", board);
            session.commit();
        }
    }
    
    public void editBoard(BoardDTO board) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            session.update("board.BoardDAO.editBoard", board);
            session.commit();
        }
    }
    
    
}