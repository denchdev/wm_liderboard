namespace :promts do
  desc "Seed the promts table with test data"
  task seed: :environment do
    get_promts(offset: 0)
  end

  def get_promts(limit: 100, offset: 0)
    response = HTTParty.get(data_path(limit: limit, offset: offset))

    promts = []
    if response["rows"].any?
      response["rows"].each do |row|
        promts << { text: row.dig("row", "Prompt") }
      end
      Promt.upsert_all(promts, unique_by: :text)
      get_promts(limit: limit, offset: offset + limit)
    end
  end

  def data_path(limit: 100, offset: 0)
    "https://datasets-server.huggingface.co/rows?dataset=Gustavosta%2FStable-Diffusion-Prompts&config=default&split=train&offset=#{offset}&limit=#{limit}"
  end
end
