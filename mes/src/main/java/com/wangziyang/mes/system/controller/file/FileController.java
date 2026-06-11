package com.wangziyang.mes.system.controller.file;

import com.wangziyang.mes.common.Result;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/upload")
public class FileController {

    private static final String UPLOAD_DIR = System.getProperty("user.dir") + "/upload/";

    @PostMapping
    public Result upload(@RequestParam("file") MultipartFile file) {
        try {
            File dir = new File(UPLOAD_DIR);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String originalFilename = file.getOriginalFilename();
            String ext = "";
            if (originalFilename != null && originalFilename.contains(".")) {
                ext = originalFilename.substring(originalFilename.lastIndexOf("."));
            }
            String filename = UUID.randomUUID().toString().replace("-", "") + ext;

            File dest = new File(dir, filename);
            file.transferTo(dest);

            Map<String, Object> data = new HashMap<>();
            data.put("src", "/files/" + filename);
            data.put("title", originalFilename);

            return Result.success(data);
        } catch (Exception e) {
            return Result.fail("上传失败");
        }
    }
}
