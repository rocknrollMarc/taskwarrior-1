require 'test_helper'

class TestRepositoryLoad < Test::Unit::TestCase
  include TaskWarrior
  include TaskWarrior::Test::Fixtures

  def setup
    @repo = Repository.new
  end

  def test_empty
    assert_equal(0, @repo.tasks.size)
    assert_equal(0, @repo.projects.size)
    assert_equal(0, @repo.tags.size)
  end

  def test_different_projects_tags
    @repo.load(File.read(fixture('party_taxes.json')))
    assert_equal(8, @repo.tasks.size)
    assert_equal(1, @repo.projects.size)
    assert_equal(2, @repo.tags.size)

    readback = Repository.new
    readback.load(@repo.dump)
    assert_equal(@repo, readback)
  end

  def test_different_projects_tags_no_deps
    @repo.load(File.read(fixture('no_deps.json')))
    assert_equal(6, @repo.tasks.size)
    assert_equal(1, @repo.projects.size)
    assert_equal(1, @repo.tags.size)
  end
end
