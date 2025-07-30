# PowerSync SQL.js

A specialized fork of SQL.js that combines the power of SQL.js (SQLite compiled to JavaScript via Emscripten) with PowerSync's [Rust core extension](https://github.com/powersync-ja/powersync-sqlite-core). This creates a completely JavaScript-based database solution that enables PowerSync functionality in environments where native dependencies cannot be used.

- No native dependencies required
- Optimized for rapid prototyping and development workflows
- Universal compatibility

> **Note:** This implementation is intended for development only. For production use, consider native adapters that offer better performance and data integrity guarantees.

## Why a fork?

Beyond loading the core extension, minor additions were needed on top of the SQL.js to be compatible with the PowerSync SDKs (for example functionality to expose `lastInsertId` and enabling `FTS5`). These are applied in the form of [git patches](https://github.com/powersync-ja/powersync-sql-js/tree/main/patches).
