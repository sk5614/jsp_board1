package board;

//import board.BoardDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class BoardDAO {
    private SqlSessionFactory sqlSessionFactory;

    public BoardDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public List<BoardDTO> boardList() {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("board.BoardDAO.boardList");
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
}