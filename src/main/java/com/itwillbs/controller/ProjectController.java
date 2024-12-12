package com.itwillbs.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.Scrap_projectDTO;
import com.itwillbs.service.ProjectService;

@Controller
public class ProjectController {

	@Inject
	private ProjectService projectService;

	@javax.annotation.Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/project/project", method = RequestMethod.GET)
	public String project1(HttpSession session, HttpServletRequest request, Model model) {
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		ProjectDTO projectDTO = projectService.getProject(p_num);
		projectService.updateProjectReadcount(projectDTO);
		model.addAttribute("memberDTO", projectService.getMember(p_num));
		model.addAttribute("projectDTO", projectDTO);
		return "project/project";
	}

	@GetMapping("/project/projectWrite")
	public String projectWrite() {
		return "project/projectWrite";
	}

	@GetMapping("/board/searchCom")
	public String project(HttpServletRequest request, PageDTO pageDTO, Model model) {
		// 검색어 가져오기(notice submit에서 name = "search")
		String search = request.getParameter("search");
		String select = request.getParameter("select");
		String sort = request.getParameter("sort");

		// 한화면에 보여줄 글개수 설정
		int pageSize = 5;
		// pageNum 에 파라미터값을 가져오기
		String pageNum = request.getParameter("pageNum");
		// pageNum이 없으면 "1"로 설정
		if (pageNum == null) {
			pageNum = "1";
		}
		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		// pageDTO 저장
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		// 검색어 추가
		pageDTO.setSearch(search);
		// select 추가
		pageDTO.setSelect(select);
		// sort 추가
		pageDTO.setSort(sort);

		List<ProjectDTO> projectBoardList = projectService.getProjectBoardList(pageDTO);

		// 페이징 작업
		// 전체 글개수 구하기 int 리턴할형 count = getProjectBoardCount()
		int count = projectService.getProjectBoardCount(pageDTO);
		// 한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		// 한 화면에 보여줄 시작페이지 구하기
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		// 한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		// pageDTO 저장
		pageDTO.setCount(count); // notice.jsp => [전체글개수 ${pageDTO.count}]
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		// model 저장
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("projectBoardList", projectBoardList);

		return "board/searchCom";
	}

	// 찜하기
	@GetMapping("/project/scrap")
	public String scrap(Scrap_projectDTO scrap_projectDTO, HttpSession session, HttpServletRequest request) {
		System.out.println("ResumeController scrap()");
		scrap_projectDTO.setP_num(Integer.parseInt(request.getParameter("p_num")));
		scrap_projectDTO.setId((String) session.getAttribute("id"));
		Scrap_projectDTO scrap_projectDTO2 = projectService.scrap(scrap_projectDTO);
		String result = "";
		if (scrap_projectDTO2 != null) {
			result = "scrapDup";
		} else {
			result = "scrapOk";
			projectService.insertScrap(scrap_projectDTO);
		}
		return "redirect:/board/searchCom";
	}

	// 삭제
	@GetMapping("project/projectDelete")
	public String resumeDelete(ProjectDTO projectDTO, HttpServletRequest request) {
		System.out.println("ProjectController projectDelete()");
		System.out.println(request.getParameter("p_num"));
		projectService.projectDelete(projectDTO);
		return "redirect:/board/searchCom";
	}

	// 프로젝트 작성
	@PostMapping("project/projectWritePro")
	public String projectWritePro(HttpServletRequest request, MultipartFile file) throws Exception {
		System.out.println("MemberController projectWritePro()");
		System.out.println(request.getParameter("p_num"));
		ProjectDTO projectDTO = new ProjectDTO();
		// 파일 업로드
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
		System.out.println(filename);
		System.out.println(uploadPath);
		FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
		projectDTO.setP_file(filename);
//		projectDTO.setP_num(Integer.parseInt(request.getParameter("p_num")));
		projectDTO.setId(request.getParameter("id"));
		projectDTO.setRegion_num(Integer.parseInt(request.getParameter("region_num")));
		projectDTO.setField_num(Integer.parseInt(request.getParameter("field_num")));
		projectDTO.setP_member(Integer.parseInt(request.getParameter("p_member")));
		projectDTO.setP_title(request.getParameter("p_title"));
		projectDTO.setP_content(request.getParameter("p_content"));
		projectDTO.setP_writedate(new Timestamp(System.currentTimeMillis()));
		String p_start = request.getParameter("p_start");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date d1 = format.parse(p_start);
		Timestamp jdate1 = new Timestamp(d1.getTime());
		projectDTO.setP_start(jdate1);
		String p_end = request.getParameter("p_end");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		Date d2 = format2.parse(p_end);
		Timestamp jdate2 = new Timestamp(d2.getTime());
		projectDTO.setP_end(jdate2);
		String p_deadline = request.getParameter("p_deadline");
		SimpleDateFormat format3 = new SimpleDateFormat("yyyy-MM-dd");
		Date d3 = format3.parse(p_deadline);
		Timestamp jdate3 = new Timestamp(d3.getTime());
		projectDTO.setP_deadline(jdate3);

		System.out.println(projectDTO.toString());
		projectService.insertProject(projectDTO);
		return "redirect:/mypageCompany/mypageCompany2";
	}

	// 글 수정
	@GetMapping("project/projectUpdate")
	public String projectUpdate(ProjectDTO projectDTO, HttpServletRequest request, Model model) {
		System.out.println("ProjectController projectUpdate()");
		System.out.println(projectDTO);
		int p_num = projectDTO.getP_num();
		model.addAttribute("projectDTO", projectService.getMember(p_num));
		System.out.println(projectService.getMember(p_num));
		model.addAttribute("projectDTO", projectService.getProject(p_num));
		System.out.println(projectService.getProject(p_num));
		return "project/projectUpdate";
	}

	@PostMapping("project/projectUpdatePro")
	public String projectUpdatePro(HttpSession session, HttpServletRequest request, MultipartFile file)
			throws Exception {
		System.out.println("ProejctController projectUpdatePro()");

		String id = (String) session.getAttribute("id");
		System.out.println(id);
		ProjectDTO projectDTO = new ProjectDTO();

		projectDTO.setP_num(Integer.parseInt(request.getParameter("p_num")));
		projectDTO.setId(request.getParameter("id"));
		projectDTO.setRegion_num(Integer.parseInt(request.getParameter("region")));
		projectDTO.setField_num(Integer.parseInt(request.getParameter("field")));
		projectDTO.setP_member(Integer.parseInt(request.getParameter("p_member")));
		projectDTO.setP_title(request.getParameter("p_title"));
		projectDTO.setP_content(request.getParameter("p_content"));
		projectDTO.setP_writedate(new Timestamp(System.currentTimeMillis()));
		String p_start = request.getParameter("p_start");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date d1 = format.parse(p_start);
		Timestamp jdate1 = new Timestamp(d1.getTime());
		projectDTO.setP_start(jdate1);
		String p_end = request.getParameter("p_end");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		Date d2 = format2.parse(p_end);
		Timestamp jdate2 = new Timestamp(d2.getTime());
		projectDTO.setP_end(jdate2);
		String p_deadline = request.getParameter("p_deadline");
		SimpleDateFormat format3 = new SimpleDateFormat("yyyy-MM-dd");
		Date d3 = format3.parse(p_deadline);
		Timestamp jdate3 = new Timestamp(d3.getTime());
		projectDTO.setP_deadline(jdate3);

		if (file.isEmpty()) {
			System.out.println("첨부파일 없음");
			projectDTO.setP_file(request.getParameter("oldfile"));
		} else {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			String filename = uuid.toString() + "_" + file.getOriginalFilename();
			System.out.println(filename);

			System.out.println(uploadPath);
			FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));

			projectDTO.setP_file(filename);
		}
		System.out.println(projectDTO);
		projectService.projectUpdate(projectDTO);
		return "redirect:/board/searchCom";
	}

}