require 'dijkstra'
class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]
  before_action :loadroutes, only:[:getroute]
  def loadroutes
   drive=[[]]
   @bike=[]
   @pt=[]
   tempd=Edge.select('startnode,endnode,distance').joins('inner join edgemeta on edges.id=edgemeta.edge_id where mode_id=1')
   for item in tempd
    temdr=[item.startnode,item.endnode,item.distance]
    drive.push(temdr)
   end
   tempd=Edge.select('startnode,endnode,distance').joins('inner join edgemeta on edges.id=edgemeta.edge_id where mode_id=2')
   for item in tempd
    temdr=[item.startnode,item.endnode,item.distance]
    @bike.push(temdr)
   end
   tempd=Edge.select('startnode,endnode,distance').joins('inner join edgemeta on edges.id=edgemeta.edge_id where mode_id=3')
   for item in tempd
    temdr=[item.startnode,item.endnode,item.distance]
    @pt.push(temdr)
   end
   ob = Dijkstra.new(1, 4, drive)
   puts "wwwwwwwwwwwwwwwwwwwwwwwwww"
   puts ob.shortest_path
  end

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  
  def getusersloc
    locids=Game.select('user_id,location_id').where(status:0,current_loc_type:'N')
    usersloc=[]   
    puts locids.inspect
    locids.each do |item|
      user=User.find(item.user_id)
      puts user.name
      node=Node.find(item.location_id)
      usersloc.push({
              location: [node.lat, node.lon] ,
              name: user.name
            })
    end 
    render :json=> { :usersloc=>usersloc }, :status=>200    
  end
  def getroute
    puts "I am here"
    @game = Game.new(game_params)
#    puts @game.inspect
    
    q_tm=@game.travel_mod
    nq_tm="has_drive_link"
    if (q_tm==3) then 
      nq_tm="has_pt_link"
    end
    if (q_tm==2) then 
      nq_tm="has_bike_link"
    end
    puts nq_tm.inspect
    #uri = URI.parse('http://localhost:7474/db/data/transaction/commit')
    uri = URI.parse(Rails.configuration.neo4jurl)

    headers = {'Content-Type' => "application/json", 'Accept' => "application/json; charset=UTF-8", 'Authorization' => Rails.configuration.neo4jauth }
    data= {
  "statements": [
    {
      "statement": "MATCH (from:Location { L_ID:"+ @game.origin.to_s + " }), (to:Location { L_ID:" + @game.destination.to_s + "}) , path =shortestPath( (from)-[:" +nq_tm + "*]->(to))\nRETURN path AS shortestPath,\n    reduce(distance = 0, r in relationships(path) | distance+r.distance) AS totalDistance\n    ORDER BY totalDistance ASC\n    LIMIT 1",
      "resultDataContents": [
        "row",
        "graph"
      ],
      "includeStats": false
    }
  ]
   }

    
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body =data.to_json 
    response = http.request(request)
    jre=JSON.parse(response.body)
    puts (jre["results"][0])["data"].empty?
    waypoints=[]
    unless (jre["results"][0])["data"].empty?   
      distance =jre["results"][0]#.data[0].row[1]
      puts (distance["data"][0])["row"][1].inspect
      puts "nodes"
    
      nodelistjs=(((jre["results"][0])["data"][0])["graph"])["nodes"]
      linklistjs=(((jre["results"][0])["data"][0])["graph"])["relationships"]
      nodeids=[]
      linkids=[]
      nodelistjs.each do |item|
        nodeids.push(item["properties"]["L_ID"])
      end
      linklistjs.each do |item|
        linkids.push(item["properties"]["edge_id"])
      end      
      puts linkids.inspect
      nodesinfo=Node.where(id: nodeids)
      for node in nodesinfo
       waypoints.push({
              location: [node.lat, node.lon] ,
              name: node.name
            })
      end
      puts waypoints.inspect
      cost=Edgemetum.where(edge_id: linkids, mode_id:@game.travel_mod,condition_id:@game.condition_id).sum(:cost)
      
      nopeopleinedge=Game.where(current_loc_type: 'E', status: 0, location_id: linkids).count(:location_id)
     
    end
    cost=10
    render :json=> {:cost=>cost, :wp=>waypoints, :traveltime=>5,:comingedge=>-1,    :accind=>0 }, :status=>200
    
  end

  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    puts current_user.id
    @game.user_id=current_user.id
    @game.start_date=Time.new
    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
#      params.require(:game).permit(:condition_id, :travel_mod, :user_id, :status, :start_date, :end_date, :origin, :destination, :budget, :travel_time, :current_loc_type, :location_id)
      params.require(:game).permit(:condition_id, :travel_mod, :status, :start_date, :end_date, :origin, :destination, :budget, :travel_time, :current_loc_type, :location_id)

    end
end
