import React from 'react';
import SearchResults from './search_results';

class Search extends React.Component {
  constructor(props) {
    super(props);

    this.state = { search: '' };
    this.page = 1
    this.loadMore = this.loadMore.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    window.scrollTo(0, 0);
    dispatch(this.props.resetSneakers());
  }

  componentWillUnmount() {
    dispatch(this.props.resetSneakers());
  }

  loadMore() {
    this.page++;
    this.props.searchSneakers(this.state.search, this.page);
  }

  handleSearch() {
    return (e) => {
      this.props.searchSneakers( e.target.value, this.page );
      this.setState({ search: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
  }

  render() {
    debugger
    return (
      <div>
        <section className="search-container">
          <div className="search-bar-container">
            <form className="search-bar">
              <input type="text" className="search-query" placeholder="Type to search" onChange={this.handleSearch()} />
            </form>
          </div>
        </section>
        <section className="search-results">
          <SearchResults props={this.props} search={this.state.search} />
        </section>
      </div>
    )
  }
}

export default Search;