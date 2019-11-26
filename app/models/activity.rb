class Activity < ApplicationRecord

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Activity.create! row.to_hash
        end
    end
end
