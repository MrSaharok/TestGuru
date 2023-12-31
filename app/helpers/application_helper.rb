module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow',
            class: 'text-secondary'
  end

  def flash_messages(type)
    case type
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :alert then 'alert alert-danger'
    else
      'alert alert-primary'
    end
  end
end
