package common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public interface Command {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
