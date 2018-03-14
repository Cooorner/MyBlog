package pushlettest;

import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.EventPullSource;

public class HelloWorldPlushlet {
	public HelloWorldPlushlet(){}
	
	public static class HwPlushlet extends EventPullSource { 
		
		public HwPlushlet() {}
		
        // 休眠五秒  
        @Override  
        public long getSleepTime() {  
            return 5000;  
        }  
        @Override  
        public Event pullEvent() {  
            Event event = Event.createDataEvent("/cuige/he");  
            event.setField("mess", "hello,world!Plushlet!");  
            return event;  
        }  
    }  
}
