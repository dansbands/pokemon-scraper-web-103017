# responsible for saving, adding,
# removing, or changing anything
# about each Pokémon

class Pokemon

  attr_accessor :name, :type, :db, :id
  def initialize(pokemon)
    # @id = id
     @name = pokemon[:name]
     @type = pokemon[:type]
     @db = pokemon[:db]
     @id = pokemon[:id]
     @pokemon = pokemon
  end

  def self.save(name, type, db)
     #binding.pry
    #{}"INSERT INTO #{db} (id, name, type) VALUE('#{name}', '#{type}')"
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
    #db.execute("INSERT INTO stations (id, name, line, division, latitude, longitude) VALUES (#{row[0]}, \"#{row[1]}\", \"#{row[2]}\", \"#{row[3]}\", #{row[4]}, #{row[5]})")

  end

  def self.find(id, db)

    var = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    flat_var = var.flatten
    pokemon1 = Pokemon.new(id: flat_var[0], name: flat_var[1], type: flat_var[2], db: db)

    pokemon1

  end

end
