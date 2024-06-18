package user;

import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class UserDAO {
    private SqlSessionFactory sqlSessionFactory;

    public UserDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public UserDTO getUserByUsernameAndPassword(String username, String password) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, String> params = new HashMap<>();
            params.put("username", username);
            params.put("password", password);
            return session.selectOne("user.UserMapper.getUserByUsernameAndPassword", params);
        }
    }
}
