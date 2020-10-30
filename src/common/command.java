package common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface command {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
