class NodesController < ApplicationController
  before_action :set_node, only: [:show, :update, :destroyi,:get_nodequestion]


  def get_nodequestion

#   puts question.answer.find(
    q= @node.question.all
 #  puts q.inspect
    q_id=q.first
#   puts q_id
    a=Answer.where(question_id:q_id)

    render json:  { "question": q, "answer":a},:status=>200

   end

  # GET /nodes
  def index
    @nodes = Node.all
    render json: @nodes
  end

  # GET /nodes/1
  def show
    puts "this one"
    render json: @node
  end

  # POST /nodes
  def create
    @node = Node.new(node_params)

    if @node.save
      render json: @node, status: :created, location: @node
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nodes/1
  def update
    if @node.update(node_params)
      render json: @node
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nodes/1
  def destroy
    @node.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node
      @node = Node.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def node_params
      params.require(:node).permit(:name, :desc, :lat, :lon,)
    end
end
