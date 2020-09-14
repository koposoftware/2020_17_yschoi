package kr.ac.kopo.util;
import java.text.*;
import java.math.*;
import java.util.*;
public class MakeUtil {
        
        /**
         * 작성자 :황선헌
         * 금액(double)을 금액표시타입(소숫점2자리) 으로 변환한다. <BR>
         * (예) 12345678.1 --> 12,345,678.10         <BR>
         * delemeter를 주지 않는 경우 처리           <BR>
         * </pre>
         *
         * @param    moneyString 금액 (double형).
         * @return   변경된 금액 문자열.
         */
        public static String makeMoneyType(double dblMoneyString)
        { 
                String moneyString = new Double(dblMoneyString).toString();

                String format = "###,###,###0.00";
                DecimalFormat df = new DecimalFormat(format);
                DecimalFormatSymbols dfs = new DecimalFormatSymbols();

                dfs.setGroupingSeparator(',');// 구분자를 ,로
                df.setGroupingSize(3);//3자리 단위마다 구분자처리 한다.
                df.setDecimalFormatSymbols(dfs);


                return (df.format(Double.parseDouble(moneyString))).toString();
          
          

        }
        
        
        
        public static String makeMoneyType2(double dblMoneyString)
        { 
                String moneyString = new Double(dblMoneyString).toString();

                String format = "###,###,###0.00000";
                DecimalFormat df = new DecimalFormat(format);
                DecimalFormatSymbols dfs = new DecimalFormatSymbols();

                dfs.setGroupingSeparator(',');// 구분자를 ,로
                df.setGroupingSize(3);//3자리 단위마다 구분자처리 한다.
                df.setDecimalFormatSymbols(dfs);


                return (df.format(Double.parseDouble(moneyString))).toString();
          
          

        }
        
        
}
