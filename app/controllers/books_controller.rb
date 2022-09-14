class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # We need to add our code to the routes below -> These are already configured
  # We need to add the correct functionality
  # To alter the HTML inside of these, go into the views/books/* folder where
  # the .html.erb files are. This is where we can edit and do stuff. 
  # The @variable allows us to access those variables inside of the files 
  # specified above. We just need to figure out how to grab that data and 
  # alter it to our liking.

  # Need to figure out how we can add the following attributes to the books (look
  # at title and try to mimic):
  #   - author
  #   - price
  #   - published date

  # The "Book" is an active record -> This is our Model and how we interact with the database
  # Using this, we can update/delete/add to our database
  # It has a lot of inbuilt methods such as .new or .save -> Check the new method below or .save inside of create

  # Look into ActiveRelation, we can use this to find certain books (will need in update/delete commands)
  # We can use ActiveRelation to do queries rather than actual SQL

  # We need to figure out how we can adjust the database to add the extra attributes -> How do they have title?
  # Look at db/schema.rb !!! We found the title -> Adjust to add the extra attributes

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  def delete
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    # Later when we add attributes, we can use the new with parameters to put the correct attribute values
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        flash[:notice] = "Book by the title of " + @book.title + " was successfully created."
        format.html { redirect_to books_url }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        flash[:notice] = "Book by the title of " + @book.title + " was successfully updated."
        format.html { redirect_to books_url }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    
    respond_to do |format|
      flash[:notice] = "Book by the title of " + @book.title + " was successfully deleted."
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      # Add the extra parameters here
      params.require(:book).permit(:title, :author, :price, :published_date)
    end

end
