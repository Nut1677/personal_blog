package org.example;

import java.util.stream.LongStream;
import java.util.stream.Stream;

//TIP 要<b>运行</b>代码，请按 <shortcut actionId="Run"/> 或
// 点击装订区域中的 <icon src="AllIcons.Actions.Execute"/> 图标。
public class Main {
    public static void main(String[] args) {
        long a=1,b=1,c=1;
        for(int i=1;i<=20;i++){
            System.out.println(a);
            c=a+b;
            a=b;
            b=c;
        }
    }
}