module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "github", "https://github.com/#{author}/#{repo}/", rel: :nofollow, target: :_blank
  end
end
