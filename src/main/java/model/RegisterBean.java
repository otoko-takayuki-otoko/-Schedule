package model;

public class RegisterBean {
	private String title;
	private String start;
	private String end;
	private String allDay;
	
	public RegisterBean(String title, String start, String end, String allDay) {
		title = this.title;
		start = this.start;
		end = this.end;
		allDay = this.allDay;
	};
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

}
