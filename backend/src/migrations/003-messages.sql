CREATE TYPE message_role AS ENUM ( 
	"user",
	"assistant"
)

CREATE TYPE message_type AS ENUM (
	"result",
	"error"
)

CREATE TABLE IF NOT EXISTS messages (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
	content TEXT NOT NULL,
	role message_role NOT NULL,
	message_type message_type NOT NULL,
	project_id BIGINT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
	created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMPZ NOT NULL DEFAULT CURRENT_TIMESTAMP
)
