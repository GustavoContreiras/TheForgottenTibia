<div class="mod-default">
	<div class="module">
		<div class="module-2">
			<div class="module-3">
				<div class="module-4 deepest">
					<h3 class="module"><span class="module-2"><span class="module-3"><span class="color">Search</span> Character</span></span></h3>
					<div class="default">
						<div id="yoo-search-1" class="yoo-search">
							<!-- Character search -->
							<form action="characterprofile.php" method="GET">
								<div class="searchbox" style="">
									<button class="search-magnifier" type="submit" value="Search"></button>
									<input class="searchfield" type="text" onFocus="if(this.value=='character name...') this.value='';" onBlur="if(this.value=='') this.value='character name...';" value="character name..." size="20" alt="character name..." maxlength="25" name="name" autocomplete="off" />
									<button class="search-close" type="reset" value="Reset"></button>
								</div>	
								<input type="hidden" name="task"   value="search" />
								<input type="hidden" name="option" value="com_search" />
							</form>	
							<div class="resultbox" style="width: 400px;"></div>
							<!-- end character search -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>