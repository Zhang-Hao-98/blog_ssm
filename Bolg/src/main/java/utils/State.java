package utils;

import java.util.HashMap;
import java.util.Map;

public class State {
    //表示状态码
    private int code;
    //提示信息
    private String State;
    //要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String,Object>();

    //在controller中调用success方法，返回Msg对象
    public static State success(){
        State result = new State();
        result.setCode(100);
        result.setMsg("处理成功！");
        return result;
    }
    public static State fail(){
        State result = new State();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }

    //把pageInfo中的数据保存到Msg中，一并返回
    public State add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }


    public int getCode() {
        return code;
    }
    public void setCode(int code) {
        this.code = code;
    }
    public String getMsg() {
        return State;
    }
    public void setMsg(String State) {
        this.State = State;
    }
    public Map<String, Object> getExtend() {
        return extend;
    }
    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}