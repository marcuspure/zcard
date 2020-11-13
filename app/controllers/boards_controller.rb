class BoardsController < ApplicationController

    def index
        @boards = Board.all
        # Board.where(id: 3) 會找出預設值11筆資料
    end
    
    def show
        # find會顯示錯誤 find_by會顯示 nil   
        @board = Board.find(params[:id])
        
        # Board.find(1)
        # Board.find_by(id: 1) 可組多個變數
        # Board.find_by(email: 'aaa')
        # Board.find_by(id: 2, email: 'aaa')
    end


    def new
        @board = Board.new
    end



    def create
        # p params["board"]
    # params["board"] -> { "title" => 'ccc' }
    clean_params = params.require(:board).permit(:title)
    @board = Board.new(clean_params)
        # @boards = Board.new
        # @boards = Board.new(params["board"])
    if @board.save
            # flash["notice"] = "成功新增看板"
            # 成功
        redirect_to "/", notice:'成功新增看板'
     else
            # 失敗

     render :new 
         # render 'boards/new'
        # 資料會重洗 會重打全部
      end
     end



     
     def edit
        @board = Board.find(params[:id])
     end


     def update
        @board = Board.find(params[:id])
        clean_params = params.require(:board).permit(:title)
        if @board.update(clean_params)
        redirect_to root_path, notice: '更新成功'
        else
            render:edit
        end
     end
    end 
 

