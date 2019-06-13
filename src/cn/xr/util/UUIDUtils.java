package cn.xr.util;

import java.util.UUID;

public class UUIDUtils {

	public static String getUUid() {
		return UUID.randomUUID().toString().replace("-", "");
		
	}
}
