class Pokemon
    attr_accessor :id, :name, :type, :db

def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

end



def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
end

def self.find(idnum, db)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    LIMIT 1
    SQL
    array = db.execute(sql, idnum).flatten
    self.new(id: array[0], name: array[1], type: array[2], db: array[3])
end


end