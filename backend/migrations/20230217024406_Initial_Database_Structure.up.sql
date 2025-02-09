CREATE TABLE IF NOT EXISTS users (
    id bigint PRIMARY KEY,
    username varchar(32) NOT NULL,
    password_hash varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    email_verified boolean NOT NULL DEFAULT FALSE,
    created_at timestamptz NOT NULL DEFAULT NOW(),
    last_login_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS sessions (
    id bigint PRIMARY KEY,
    user_id bigint NOT NULL REFERENCES users (id),
    token char(64) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW(),
    expires_at timestamptz NOT NULL DEFAULT NOW(),
    last_used_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS global_roles (
    id bigint PRIMARY KEY,
    name varchar(32) NOT NULL,
    description text NOT NULL,
    rank int NOT NULL,
    -- allowed_permissions & denied_permissions = 0
    -- We only need to check one of them
    allowed_permissions bigint NOT NULL DEFAULT 0 CHECK (allowed_permissions & denied_permissions = 0),
    denied_permissions bigint NOT NULL DEFAULT 0,
    created_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS global_role_grants (
    id bigint PRIMARY KEY,
    user_id bigint NOT NULL REFERENCES users (id),
    global_role_id bigint NOT NULL REFERENCES global_roles (id),
    created_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS global_bans (
    id bigint PRIMARY KEY,
    user_id bigint NOT NULL REFERENCES users (id),
    mode bigint NOT NULL,
    reason text NOT NULL,
    expires_at timestamptz DEFAULT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS chat_rooms (
    id bigint PRIMARY KEY,
    owner_id bigint NOT NULL REFERENCES users (id),
    name varchar(32) NOT NULL,
    description text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW(),
    deleted_at timestamptz DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS channels (
    id bigint PRIMARY KEY,
    owner_id bigint NOT NULL REFERENCES users (id),
    name varchar(32) NOT NULL,
    description text NOT NULL,
    stream_key char(25) NOT NULL,
    chat_room_id bigint REFERENCES chat_rooms (id) DEFAULT NULL,
    last_live_at timestamptz DEFAULT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW(),
    deleted_at timestamptz DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS channel_roles (
    id bigint PRIMARY KEY,
    owner_id bigint NOT NULL REFERENCES users (id),
    channel_id bigint REFERENCES channels (id) DEFAULT NULL,
    name varchar(32) NOT NULL,
    description text NOT NULL,
    rank int NOT NULL,
    -- allowed_permissions & denied_permissions = 0
    -- We only need to check one of them
    allowed_permissions bigint NOT NULL DEFAULT 0 CHECK (allowed_permissions & denied_permissions = 0),
    denied_permissions bigint NOT NULL DEFAULT 0,
    created_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS channel_role_grants (
    id bigint PRIMARY KEY,
    user_id bigint NOT NULL REFERENCES users (id),
    channel_role_id bigint NOT NULL REFERENCES channel_roles (id),
    created_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS streams (
    id bigint PRIMARY KEY,
    channel_id bigint NOT NULL REFERENCES channels (id),
    title varchar(255) NOT NULL,
    description text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW(),
    started_at timestamptz DEFAULT NULL,
    ended_at timestamptz DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS follows (
    id bigint PRIMARY KEY,
    follower_id bigint NOT NULL REFERENCES users (id),
    followed_id bigint NOT NULL REFERENCES users (id),
    channel_id bigint REFERENCES channels (id) DEFAULT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS channel_bans (
    id bigint PRIMARY KEY,
    owner_id bigint NOT NULL REFERENCES users (id),
    target_id bigint NOT NULL REFERENCES users (id),
    channel_id bigint REFERENCES channels (id) DEFAULT NULL,
    mode bigint NOT NULL,
    reason text NOT NULL,
    expires_at timestamptz DEFAULT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS chat_messages (
    id bigint PRIMARY KEY,
    chat_room_id bigint NOT NULL REFERENCES users (id),
    author_id bigint NOT NULL REFERENCES users (id),
    message text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS channel_bans_user_id_idx ON channel_bans (owner_id);

CREATE INDEX IF NOT EXISTS channel_bans_target_id_idx ON channel_bans (target_id);

CREATE INDEX IF NOT EXISTS channel_bans_channel_id_idx ON channel_bans (channel_id);

CREATE INDEX IF NOT EXISTS channel_role_grants_channel_role_id_idx ON channel_role_grants (channel_role_id);

CREATE INDEX IF NOT EXISTS channel_role_grants_user_id_idx ON channel_role_grants (user_id);

CREATE INDEX IF NOT EXISTS channel_roles_owner_id_idx ON channel_roles (owner_id);

CREATE INDEX IF NOT EXISTS channel_roles_channel_id_idx ON channel_roles (channel_id);

CREATE UNIQUE INDEX IF NOT EXISTS channel_roles_name_idx ON channel_roles (owner_id, channel_id, name);

CREATE UNIQUE INDEX IF NOT EXISTS channel_roles_rank_idx ON channel_roles (owner_id, channel_id, rank);

CREATE INDEX IF NOT EXISTS channels_owner_id_idx ON channels (owner_id);

CREATE UNIQUE INDEX IF NOT EXISTS channels_name_idx ON channels (owner_id, name) WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS chat_messages_chat_room_id_idx ON chat_messages (chat_room_id);

CREATE INDEX IF NOT EXISTS chat_messages_author_id_idx ON chat_messages (author_id);

CREATE INDEX IF NOT EXISTS chat_rooms_owner_id_idx ON chat_rooms (owner_id);

CREATE UNIQUE INDEX IF NOT EXISTS chat_rooms_name_idx ON chat_rooms (owner_id, name) WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS follows_follower_id_idx ON follows (follower_id);

CREATE INDEX IF NOT EXISTS follows_followed_id_idx ON follows (followed_id);

CREATE UNIQUE INDEX IF NOT EXISTS follows_unique_idx ON follows (follower_id, followed_id, channel_id);

CREATE INDEX IF NOT EXISTS follows_channel_id_idx ON follows (channel_id);

CREATE INDEX IF NOT EXISTS global_bans_user_id_idx ON global_bans (user_id);

CREATE INDEX IF NOT EXISTS global_role_grants_global_role_id_idx ON global_role_grants (global_role_id);

CREATE INDEX IF NOT EXISTS global_role_grants_user_id_idx ON global_role_grants (user_id);

CREATE UNIQUE INDEX IF NOT EXISTS global_roles_name_idx ON global_roles (name);

CREATE UNIQUE INDEX IF NOT EXISTS global_roles_rank_idx ON global_roles (rank);

CREATE INDEX IF NOT EXISTS sessions_user_id_idx ON sessions (user_id);

CREATE UNIQUE INDEX IF NOT EXISTS sessions_token_idx ON sessions (token);

CREATE INDEX IF NOT EXISTS streams_channel_id_idx ON streams (channel_id);

CREATE UNIQUE INDEX IF NOT EXISTS users_username_idx ON users (username);

CREATE INDEX IF NOT EXISTS users_email_idx ON users (email);

CREATE INDEX IF NOT EXISTS users_email_verified_idx ON users (email_verified);
