json.extract! entidade, :id, :nome, :cnpj, :descricao, :created_at, :updated_at
json.url entidade_url(entidade, format: :json)