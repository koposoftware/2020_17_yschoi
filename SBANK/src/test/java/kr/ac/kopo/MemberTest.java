package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/spring/*.xml"})
public class MemberTest {

   @Autowired
   private MemberDAO memberDAO;
   
   @Test
   public void 로그인테스트() throws Exception {
      
      MemberVO member = new MemberVO();
      member.setId("q");
      member.setPassword("950831cys!");
      
      System.out.println("login시도"+member);
      
      MemberVO loginVO = memberDAO.login(member);
      System.out.println("loginVO"+loginVO);
      assertNotNull(loginVO);
   }
}
