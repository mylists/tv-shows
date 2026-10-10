-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS tv_shows (
    id CHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL UNIQUE,
    total_episodes INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_tv_shows (
    user_id CHAR(36) NOT NULL,
    tv_show_id CHAR(36) NOT NULL,
    current_season INTEGER DEFAULT 1,
    current_episode INTEGER DEFAULT 0,
    status VARCHAR(50) DEFAULT 'plan_to_watch',
    rating INTEGER DEFAULT 0,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, tv_show_id),
    FOREIGN KEY (tv_show_id) REFERENCES tv_shows(id) ON DELETE CASCADE
);

CREATE INDEX idx_user_tv_shows_user_id ON user_tv_shows(user_id);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS user_tv_shows;
DROP TABLE IF EXISTS tv_shows;
-- +goose StatementEnd

