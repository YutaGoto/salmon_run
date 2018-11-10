# ページが見つからないとき例外
class NotFoundException < StandardError; end

# 復活する予定がないコンテンツへの例外
class GoneException < StandardError; end

# 入力エラー
class InputErrorException < StandardError; end

# 汎用例外
class ApplicationException < StandardError; end

# 必要な権限がなかったとき例外
class AuthorityException < StandardError; end

# サイトがメンテナンスの場合の例外
class MaintenanceException < StandardError; end

# コンフリクトしている（APIでのみ利用）
class ConflictException < StandardError; end
