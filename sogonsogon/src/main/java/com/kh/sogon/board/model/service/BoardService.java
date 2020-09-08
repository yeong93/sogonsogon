package com.kh.sogon.board.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sogon.board.model.vo.Attachment;
import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Search;

public interface BoardService {

	

	
	
	/** 페이징 처리를 위한 Service
	 * @param type
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo pagination(int type, int cp);

	
	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return boardList
	 */
	public abstract List<Board> selectList(PageInfo pInfo);


	/** 게시글 상세조회 Service
	 * @param boardNo
	 * @return board
	 */
	public abstract Board selectBoard(int boardNo);


	/** 게시글 등록 Service
	 * @param board
	 * @param savePath 
	 * @param images 
	 * @return result
	 */
	public abstract int insertBoard(Board board, List<MultipartFile> images, String savePath);

	public abstract int deleteBoard(Board board);


	public abstract int updateBoard(Board upBoard, String savePath, List<MultipartFile> images, boolean[] deleteImages);


	/** 게시글 이미지 조회 Service
	 * @param boardNo
	 * @return files
	 */
	public abstract List<Attachment> selectFiles(int boardNo);


	public abstract List<Attachment> selectThumbnailList(List<Board> boardList);

	// 높은 조회수 게시글 조회 
	public abstract List<Board> selectTopViews(int type);


	public abstract PageInfo pagination(int type, int cp, Search search);

	// r검색 목록 조회 
	
	public abstract List<Board> selectSerchList(PageInfo pInfo, Search search);

	
	
	
}